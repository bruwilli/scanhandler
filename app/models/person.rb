class Person < ActiveRecord::Base
  has_many :people_first_name_trigrams, :dependent => :destroy
  has_many :people_last_name_trigrams, :dependent => :destroy
  has_many :scans, :dependent => :destroy
  has_one :user # user that created this person
  attr_accessible :first_name, :last_name
  validates :first_name, presence: true, length: { maximum: 64 }
  validates :last_name, presence: true, length: { maximum: 64 }

  after_save :handle_saved

  def self.search(first_name , last_name, is_fuzzy = false, include_nicknames = false)
    if last_name.nil? and first_name.nil?
      return order(:last_name)
    end

    # handle fastest search with a special case
    if not is_fuzzy and not include_nicknames
      if not first_name.nil?
        if not last_name.nil?
          first_name.downcase!
          last_name.downcase!
          return where("first_name like :first_name and last_name like :last_name", 
                         {first_name: first_name + '%', last_name: last_name + '%'} )
        else
          first_name.downcase!
          return where("first_name like :search", {search: first_name + '%'} ).order("length(first_name)")
        end
      else 
        last_name.downcase!
        return where("last_name like :search", {search: last_name + '%'} ).order("length(last_name)")
      end
    end

    people_by_first_name = []
    people_by_first_name_with_nicknames = []
    people_by_first_name_with_nicknames_fuzzy = []
    people_by_first_name_fuzzy = []
    people_by_last_name = []

    if not last_name.nil?
      last_name.downcase!
      people_by_last_name = where("last_name like :search", {search: last_name + '%'} ).order("length(last_name)").to_a
      if is_fuzzy
        people_by_last_name |= get_fuzzy_last_name_matches(last_name)
      end
    end

    if not first_name.nil?
      first_name.downcase!
      people_by_first_name = where("first_name like :search", {search: first_name + '%'} ).order("length(first_name)")
      if is_fuzzy
        people_by_first_name_fuzzy = get_fuzzy_first_name_matches(first_name)
      end

      if include_nicknames
        first_names = []
        name_groups = []
        nicknames = Nickname.search(first_name, is_fuzzy)
        nicknames.each do |nickname|
          p nickname.name
          first_names_from_nicknames |= nickname.name
          name_groups |= [nickname.name_group]
        end

        first_names_from_nicknames = []
        name_groups.each do |name_group|
          first_names_from_nicknames |= name_group.names.split(',')
        end

        first_names_from_nicknames.each do |first_name_from_nicknames|
          people_by_first_name_with_nicknames |= find_all_by_first_name(first_name_from_nicknames)
          if is_fuzzy
            people_by_first_name_with_nicknames_fuzzy |= get_fuzzy_first_name_matches(first_name_from_nicknames)
         end
        end
      end
    end

    result = nil
    if not first_name.nil?
      result = people_by_first_name | 
          people_by_first_name_with_nicknames | 
          people_by_first_name_fuzzy | 
          people_by_first_name_with_nicknames_fuzzy
      if not last_name.nil?
        result &= people_by_last_name
      end
    else
      result = people_by_last_name
    end
    result
  end

  protected
  def handle_saved
    word = ' ' + self.first_name.downcase
    (0..word.length-3).each do |idx|
      tg = word[idx,3]
      self.people_first_name_trigrams.create(tg: tg);
    end
    word = ' ' + self.last_name.downcase
    (0..word.length-3).each do |idx|
      tg = word[idx,3]
      self.people_last_name_trigrams.craete!(tg: tg);
    end
  end

  private
  def self.get_fuzzy_first_name_matches(first_name)
    first_name = " #{first_name} "
    limit = 4
    trigram_list = (0..first_name.length-3).collect { |idx| first_name[idx,3] }
    people = Person.joins(:people_first_name_trigrams)
    people = people.where(["tg IN (?)", trigram_list])
    people = people.group(:person_id)
    people = people.order('SUM(score) DESC')
    people = people.having('SUM(score) > ?', 1)
    people = people.limit(limit) if limit > 0
    people
  end

  def self.get_fuzzy_last_name_matches(last_name)
    last_name = " #{last_name} "
    limit = 4
    trigram_list = (0..last_name.length-3).collect { |idx| last_name[idx,3] }
    people = Person.joins(:people_last_name_trigrams)
    people = people.where(["tg IN (?)", trigram_list])
    people = people.group(:person_id)
    people = people.order('SUM(score) DESC')
    people = people.having('SUM(score) > ?', 1)
    people = people.limit(limit) if limit > 0
    people
  end

end
