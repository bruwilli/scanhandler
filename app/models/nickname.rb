class Nickname < ActiveRecord::Base
  include NoFuzz
  fuzzy :name

  belongs_to :name_group
  attr_accessible :name

  def initialize
    super
    Nickname.populate_trigram_index
  end

  #this returns an array of Nickname objects
  def self.fuzzy_search(search)
    Nickname.fuzzy_find(search.downcase, 20)
  end
 
  #this returns an active relation object
  def self.search(search) 
    if search  
      found_groups = {}
      results = []
      nicknames = Nickname.fuzzy_find(search.downcase, 20)
      nicknames.each do |nickname|
        name_group_id = nickname.name_group_id
        if ! found_groups.has_key?(name_group_id) && results.length < 2
            found_groups[name_group_id] = 1
            results << nickname
        end
      end
      results
    else 
      scoped  
    end 
  end
end
