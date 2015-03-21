# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


problems = [
            {
              :name => "Print 'Hello World'",
              :description => "Print the string 'Hello World' to Standard Out."
            }

]

problems.each do |problem|
  Problem.create!(problem)
end

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
               :name => "python"
             },
             {
               :name => "ruby"
             },
             {
               :name => "haskell"
             },
             {
               :name => "clojure"
             },
             {
               :name => "scala"
             },
             {
               :name => "erlang"
             },
             {
               :name => "ocaml"
             },
             {
               :name => "go"
             },
             {
               :name => "prolog"
             }
            ]

languages.each do |language|
  Language.create!(language)
end

