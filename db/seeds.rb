# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "test",
              email: "test@example.com",
              password: "kirapass").confirm
 print "."
 
 3.times do |n|
   User.create!(name: "admin#{(n + 1).to_s}",
                email: "admin#{(n + 1).to_s}@example.com",
                password: "password").confirm
   print "."
 end
 puts "Admin"
 
 
 16.times do |n|
   User.create!(name: "user#{(n + 1).to_s}", admin: false,
                email: "user#{(n + 1).to_s}@example.com",
                password: "password").confirm
   print "."
 end
 puts "User"
 
 15.times do |n|
   Profile.create(user_id: n + 1, stuff_code: "sample#{(n + 1)}")
   print "."
 end
 puts "Profile" 