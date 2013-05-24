class Nickname < ActiveRecord::Base
  has_many :nickname_trigrams, :dependent => :destroy
  belongs_to :name_group
  attr_accessible :name, :name_group_id

  after_save :handle_saved

  def self.search(search, is_fuzzy = false) 
    if search  
      nicknames = where("lower(name) like lower(:search)", {search: search + '%'} ).order("length(name)")
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
    sql = 'select *
           from nicknames
           inner join(
             select nickname_id, count(nickname_id) as score
             from nickname_trigrams
             where tg in (?)
             group by nickname_id
             having count(nickname_id) > 1
             order by score desc
             limit ' + limit.to_s + ') as scored_nicknames
           on nicknames.id = scored_nicknames.nickname_id'
    nicknames = Nickname.find_by_sql([sql, trigram_list])
    #nicknames = nicknames.where(["tg IN (?)", trigram_list])
    #nicknames = nicknames.group(:nickname_id)
    #nicknames = nicknames.order('SUM(score) DESC')
    #nicknames = nicknames.includes(:name_group)
    #nicknames = nicknames.limit(limit) if limit > 0
    nicknames
  end
end
