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
      Nickname.fuzzy_find(search)
    else 
      scoped  
    end 
  end

  private
  def self.get_fuzzy_matches(word)
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
   
   
  #this returns the actual records that match.
  def self.fuzzy_find(word)      
    trigrams = get_fuzzy_matches(word)
    trigrams.all.collect do |trigram|
       trigram.nickname
    end
  end    

end
