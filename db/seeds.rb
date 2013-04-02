# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {name: 'Bo', email: 'bo@me.com'},
  {name: 'Ajda', email: 'adga@hotmail.com'},
  {name: 'Jones', email: 'jo@ne.s'}
])

poll_titles = ["Colors",
               "States",
               "Foods"]

polls = []
users.each_with_index do |user, i|
  polls << Poll.create(:user_id => user.id, :title => poll_titles[i])
end

questions = []
polls.each_with_index do |poll, i|
  questions << Question.create(:poll_id => poll.id, :body => "What are your favorite #{poll_titles[i].downcase}?")
end

Choice.create(:question_id => questions[0].id, :body => "Blue")
Choice.create(:question_id => questions[0].id, :body => "Green")
Choice.create(:question_id => questions[0].id, :body => "Red")

Choice.create(:question_id => questions[1].id, :body => "California")
Choice.create(:question_id => questions[1].id, :body => "New York")
Choice.create(:question_id => questions[1].id, :body => "Ohio")

Choice.create(:question_id => questions[2].id, :body => "Bananas")
Choice.create(:question_id => questions[2].id, :body => "Crepes")
Choice.create(:question_id => questions[2].id, :body => "Pizza")


