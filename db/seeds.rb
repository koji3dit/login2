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


 # 郵政データーマスタ(本番時にも必要)
require "csv"

Prefectural.delete_all # 重複するとERRORになる為、seedの度に再作成している。
namelist = Array.new
CSV.foreach('db/prefecturals_name_seed.csv') do |row|
  record = {
    :id              => row[0].to_i,
    :name            => row[1],
  }
  p record
  name = Prefectural.create!(record)
  namelist[name.id] = name # 配列でオブジェクトを退避
end

AddressMaster.delete_all
CSV.foreach('db/postal_code_seed.csv') do |row|
  record = {
    :postal_code     => row[0],
    :prefectural     => namelist[row[1].to_i], # オブジェクトを紐付け
    :city            => row[3],
    :street          => row[4],
  }
  p record
  AddressMaster.create!(record)
end