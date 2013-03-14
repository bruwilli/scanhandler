class Nickname < ActiveRecord::Base
  belongs_to :name_group
  attr_accessible :name
end
