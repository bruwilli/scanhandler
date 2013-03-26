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
    NameGroup.find_each do |name_group|
      name_group.names.split(',').each do |name|
        Nickname.create!(name: name, name_group_id: name_group.id)
      end
    end

    50.times do |n|
      first_name  = Faker::Name.first_name
      last_name  = Faker::Name.last_name
      Person.create!(first_name: first_name,
                     last_name: last_name)
    end
  end
end