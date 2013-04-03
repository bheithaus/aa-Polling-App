# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
users = User.create([
  {name: 'Bo', email: 'bo@me.com'},
  {name: 'Ajda', email: 'adga@hotmail.com'},
  {name: 'Jones', email: 'jo@ne.s'}
])

Poll.delete_all
poll_titles = ["Colors",
               "States",
               "Foods"]
polls = []
users.each_with_index do |user, i|
  polls << Poll.create(:user_id => user.id, :title => poll_titles[i])
end

Question.delete_all
questions = []
polls.each_with_index do |poll, i|
  questions << Question.create(:poll_id => poll.id, :body => "What are your favorite #{poll_titles[i].downcase}?")
end

Choice.delete_all
Choice.create(:question_id => questions[0].id, :body => "Blue")
Choice.create(:question_id => questions[0].id, :body => "Green")
Choice.create(:question_id => questions[0].id, :body => "Red")

Choice.create(:question_id => questions[1].id, :body => "California")
Choice.create(:question_id => questions[1].id, :body => "New York")
Choice.create(:question_id => questions[1].id, :body => "Ohio")

Choice.create(:question_id => questions[2].id, :body => "Bananas")
Choice.create(:question_id => questions[2].id, :body => "Crepes")
Choice.create(:question_id => questions[2].id, :body => "Pizza")

FocusGroup.delete_all
fg = FocusGroup.create(:name => 'Programers')

Assignment.delete_all
Assignment.create(:focus_group_id => fg.id, :user_id => users.first.id)

PollsFocusGroup.delete_all
PollsFocusGroup.create(:focus_group_id => fg.id, :poll_id => polls.last.id)

puts "success!"