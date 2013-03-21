class Person < ActiveRecord::Base
  has_many :people_first_name_trigram
  has_many :people_last_name_trigram
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

  private
  def self.get_first_name_fuzzy_matches(word)
    word = " #{word} "
    limit = 4
    trigram_list = (0..word.length-3).collect { |idx| word[idx,3] }
    trigrams = PersonFirstNameTrigram.where(["tg IN (?)", trigram_list])
    trigrams = trigrams.group(:person_id)
    trigrams = trigrams.order('SUM(score) DESC')
    trigrams = trigrams.includes(:person)
    trigrams = trigrams.limit(limit) if limit > 0
    trigrams
  end
   
   
  #this returns the actual records that match.
  def self.fuzzy_find_first_name(word)      
    trigrams = get_first_name_fuzzy_matches(word)
    trigrams.all.collect do |trigram|
       trigram.person
    end
  end    
  def self.get_last_name_fuzzy_matches(word)
    word = " #{word} "
    limit = 4
    trigram_list = (0..word.length-3).collect { |idx| word[idx,3] }
    trigrams = PersonLastNameTrigram.where(["tg IN (?)", trigram_list])
    trigrams = trigrams.group(:person_id)
    trigrams = trigrams.order('SUM(score) DESC')
    trigrams = trigrams.includes(:person)
    trigrams = trigrams.limit(limit) if limit > 0
    trigrams
  end
   
   
  #this returns the actual records that match.
  def self.fuzzy_find_last_name(word)      
    trigrams = get_last_name_fuzzy_matches(word)
    trigrams.all.collect do |trigram|
       trigram.person
    end
  end    
end
