class PersonNote < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  attr_accessible  :text

  validates :text, presence: true
end
