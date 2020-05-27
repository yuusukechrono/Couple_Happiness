# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

#CSV.foreach('db/question.csv') do |row|
 # Question.create(:category_id => row[0], :detail => row[1], :answer_left => row[2], #:answer_right => row[3])
#end

CSV.foreach('db/user.csv') do |row|
  User.create(:last_name => row[0], :first_name => row[1], :email => row[2], :password => row[3], :password_confirmation => row[4], :sex => row[5], :material_status => row[6], :birthday => row[7])
end