class Person < ActiveRecord::Base
  has_many :people_first_name_trigram, :dependent => :destroy
  has_many :people_last_name_trigram, :dependent => :destroy
  has_one :user # user that created this person
  attr_accessible :first_name, :last_name

  def self.initialize
    super
    Person.populate_trigram_index
  end

  def self.populate_trigram_index
    clear_trigram_index
    
    self.all.each do |i|
      word = ' ' + i.first_name
      (0..word.length-3).each do |idx|
        tg = word[idx,3].downcase
        PersonFirstNameTrigram.create(tg: tg, person_id: i.id)
      end
      word = ' ' + i.last_name
      (0..word.length-3).each do |idx|
        tg = word[idx,3].downcase
        PersonLastNameTrigram.create(tg: tg, person_id: i.id)
      end
    end
    true
  end

  def self.clear_trigram_index
    PersonFirstNameTrigram.delete_all
    PersonLastNameTrigram.delete_all
  end

  def self.search_first_name(search) 
    if search  
      Person.fuzzy_find_first_name(search)
    else 
      scoped  
    end 
  end
  
  def self.search_last_name(search) 
    if search  
      Person.fuzzy_find_last_name(search)
    else 
      scoped  
    end 
  end

  def self.search(first_name, last_name, is_fuzzy, include_nicknames)
    # handle fastest search with a special case
    if not is_fuzzy and not include_nicknames
      if not first_name.nil?
        if not last_name.nil?
          return where("first_name like :first_name and last_name like :last_name", 
                         {first_name: first_name + '%', last_name: last_name + '%'} )
        else
          return where("first_name like :search", {search: first_name + '%'} ).order("length(first_name)")
        end
      else 
        if not last_name.nil?
          return where("last_name like :search", {search: last_name + '%'} ).order("length(last_name)")
        else
          return []
        end
      end
    end

    people_by_first_name = []
    people_by_first_name_with_nicknames = []
    people_by_first_name_with_nicknames_fuzzy = []
    people_by_first_name_fuzzy = []
    people_by_last_name = []

    if first_name.nil?
      return [] if last_name.nil?
      people_by_last_name = where("last_name like :search", {search: last_name + '%'} ).order("length(last_name)")
      if is_fuzzy
        people_by_last_name |= get_fuzzy_last_name_matches(last_name)
      end

    else
      people_by_first_name = where("first_name like :search", {search: first_name + '%'} ).order("length(first_name)")
      if is_fuzzy
        people_by_first_name_fuzzy = get_fuzzy_first_name_matches(first_name)
      end

      if include_nicknames
        first_names = []
        name_groups = []
        nicknames = Nickname.search(first_name, is_fuzzy)
        nicknames.each do |nickname|
          first_names_from_nicknames |= nickname.name
          name_groups |= nickname.name_group
        end

        first_names_from_nicknames = []
        name_groups.each do |name_group|
          first_names_from_nicknames |= name_group.split(',')
        end

        first_names_from_nicknames.each do |first_name_from_nicknames|
          people_by_first_name_with_nicknames |= where("first_name like :search", {search: first_name_from_nicknames + '%'} ).order("length(first_name)")
          if is_fuzzy
              people_by_first_name_with_nicknames_fuzzy |= get_fuzzy_first_name_matches(first_name_from_nicknames)
          end
        end
      end
    end
    (people_by_first_name | 
     people_by_first_name_with_nicknames | 
     people_by_first_name_fuzzy | 
     people_by_first_name_with_nicknames_fuzzy) & 
    people_by_last_name
  end

  private
  def self.get_fuzzy_first_name_matches(first_name)
    first_name = " #{first_name} "
    limit = 4
    trigram_list = (0..first_name.length-3).collect { |idx| first_name[idx,3] }
    people = Person.joins(:person_first_name_trigram)
    people = people.where(["tg IN (?)", trigram_list])
    people = people.group(:person_id)
    people = people.order('SUM(score) DESC')
    people = people.limit(limit) if limit > 0
    people
  end

  def self.get_fuzzy_last_name_matches(last_name)
    last_name = " #{last_name} "
    limit = 4
    trigram_list = (0..last_name.length-3).collect { |idx| last_name[idx,3] }
    people = Person.joins(:person_last_name_trigram)
    people = people.where(["tg IN (?)", trigram_list])
    people = people.group(:person_id)
    people = people.order('SUM(score) DESC')
    people = people.limit(limit) if limit > 0
    people
  end

end
