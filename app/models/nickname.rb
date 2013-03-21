class Nickname < ActiveRecord::Base
  has_many :nickname_trigram
  belongs_to :name_group
  attr_accessible :name

  def self.populate_trigram_index
    clear_trigram_index
    
    self.all.each do |i|
      word = ' ' + i.name
      (0..word.length-3).each do |idx|
        tg = word[idx,3].downcase
        NicknameTrigram.create(tg: tg, nickname_id: i.id)
      end
    end
    true
  end


  def self.initialize
    super
    populate_trigram_index
  end

  def self.clear_trigram_index
    NicknameTrigram.delete_all
  end

  def self.search(search) 
    if search  
      nicknames = where("name like :search", {search: search + '%'} ).order("length(name)")
      if nicknames.count == 0
        #Nickname.fuzzy_find(search)
        Nickname.get_fuzzy_matches(search)
      else
        nicknames
      end
    else 
      scoped  
    end 
  end

  private
  def self.get_fuzzy_matches_old(word)
    word = " #{word} "
    limit = 4
    trigram_list = (0..word.length-3).collect { |idx| word[idx,3] }
    trigrams = NicknameTrigram.where(["tg IN (?)", trigram_list])
    trigrams = trigrams.group(:nickname_id)
    trigrams = trigrams.order('SUM(score) DESC')
    trigrams = trigrams.includes(:nickname => :name_group)
    trigrams = trigrams.limit(limit) if limit > 0
    trigrams
  end

  def self.get_fuzzy_matches(word)
    word = " #{word} "
    limit = 4
    trigram_list = (0..word.length-3).collect { |idx| word[idx,3] }
    nicknames = Nickname.joins(:nickname_trigram)
    nicknames = nicknames.where(["tg IN (?)", trigram_list])
    nicknames = nicknames.group(:nickname_id)
    nicknames = nicknames.order('SUM(score) DESC')
    nicknames = nicknames.includes(:name_group)
    nicknames = nicknames.limit(limit) if limit > 0
    nicknames
  end
   
   
  #this returns the actual records that match.
  def self.fuzzy_find(word)      
    trigrams = get_fuzzy_matches(word)
    trigrams.all.collect do |trigram|
       trigram.nickname
    end
  end    

end
