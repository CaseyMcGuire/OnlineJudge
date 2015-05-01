# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

statuses = [
            {
              :name => "Pending"
            },
            {
              :name => "Running"
            },
            {
              :name => "Success"
            },
            {
              :name => "Failure"
            }
           ]

statuses.each do |status|
  Status.create!(status)
end

languages = [
             {
               :name => "java"
             },
             {
               :name => "c"
             },
             {
               :name => "c++"
             },
             {
               :name => "python"
             },
             {
               :name => "ruby"
             },
             {
               :name => "haskell"
             },
             {
               :name => "ocaml"
             },
             {
               :name => "go"
             }
            ]

languages.each do |language|
  Language.create!(language)
end

