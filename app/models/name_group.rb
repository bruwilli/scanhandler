class NameGroup < ActiveRecord::Base
  has_many :nicknames, :dependent => :destroy
  attr_accessible :names
end
