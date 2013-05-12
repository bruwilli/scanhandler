require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    NameGroup.destroy_all
    NameGroup.create!(names: "Jon,Jonathan,John,Johnny")
    NameGroup.create!(names: "Bob,Bobby,Robert,Rob,Robby")
    NameGroup.create!(names: "Jessica,Jess,Jessie,Jessy")
    NameGroup.create!(names: "Jerry,Gerald,Jerome,Jer")
    NameGroup.create!(names: "Caley,Kalee,Cayley,Kayley,Kay,Cay")
    NameGroup.create!(names: "Bill,William,Billy")
    NameGroup.create!(names: "Joe,Joseph,Jo")

    Person.destroy_all
    50.times do |n|
      first_name  = Faker::Name.first_name
      last_name  = Faker::Name.last_name
      User.first.people.create!(first_name: first_name, last_name: last_name)
    end
    User.first.people.create!(first_name: "Bob", last_name: "Johnson")
    User.first.people.create!(first_name: "Roberta", last_name: "Jackson")
    User.first.people.create!(first_name: "Jerry", last_name: "Willams")
    User.first.people.create!(first_name: "Bill", last_name: "Torrey")
    User.first.people.create!(first_name: "Robby", last_name: "Passy")
    User.first.people.create!(first_name: "Robby", last_name: "Baker")
    User.first.people.create!(first_name: "Robby", last_name: "Willis")
    User.first.people.create!(first_name: "Joseph", last_name: "Baker")
    User.first.people.create!(first_name: "Jessica", last_name: "Johnson")
  end
end