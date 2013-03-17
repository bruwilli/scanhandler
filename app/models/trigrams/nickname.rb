class Trigrams::Nickname < ActiveRecord::Base
  attr_accessible :nickname_id, :tg
  belongs_to :nickname, :class_name => "::Nickname"
  
end
