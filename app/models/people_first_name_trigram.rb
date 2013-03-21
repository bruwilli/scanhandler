class PeopleFirstNameTrigram < ActiveRecord::Base
  belongs_to :person
  attr_accessible :tg, :person_id
end
