# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scan do
    user nil
    person nil
    scan_date "2013-04-22"
  end
end
