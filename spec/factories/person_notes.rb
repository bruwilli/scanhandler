# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person_note do
    text "MyText"
    user_id "MyString"
    references ""
    person_id "MyString"
    references ""
  end
end
