class NicknameTrigram < ActiveRecord::Base
  belongs_to :nickname
  attr_accessible :tg, :nickname_id
end
