class Nickname < ActiveRecord::Base
  has_many :nickname_trigrams, :dependent => :destroy
  belongs_to :name_group
  attr_accessible :name, :name_group_id

  after_save :handle_saved

  def self.search(search, is_fuzzy = false) 
    if search  
      nicknames = where("name like :search", {search: search + '%'} ).order("length(name)")
      if is_fuzzy == true and nicknames.count == 0
        Nickname.get_fuzzy_matches(search.downcase)
      else
        nicknames
      end
    else 
      scoped  
    end 
  end

  protected
  def handle_saved
    word = ' ' + self.name
    (0..word.length-3).each do |idx|
      tg = word[idx,3].downcase
      NicknameTrigram.create(tg: tg, nickname_id: self.id)
    end
  end

  def self.get_fuzzy_matches(word)
    word = " #{word} "
    limit = 4
    trigram_list = (0..word.length-3).collect { |idx| word[idx,3] }
    nicknames = Nickname.joins(:nickname_trigrams)
    nicknames = nicknames.where(["tg IN (?)", trigram_list])
    nicknames = nicknames.group(:nickname_id)
    nicknames = nicknames.order('SUM(score) DESC')
    nicknames = nicknames.includes(:name_group)
    nicknames = nicknames.limit(limit) if limit > 0
    nicknames
  end
end
