# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130402233412) do

  create_table "answers", :force => true do |t|
    t.integer  "respondent_id"
    t.integer  "choice_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "answers", ["respondent_id", "choice_id"], :name => "index_answers_on_respondent_id_and_choice_id"

  create_table "assignments", :force => true do |t|
    t.integer  "focus_group_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "assignments", ["user_id", "focus_group_id"], :name => "index_assignments_on_user_id_and_focus_group_id"

  create_table "choices", :force => true do |t|
    t.integer  "question_id"
    t.text     "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "choices", ["question_id"], :name => "index_choices_on_question_id"

  create_table "focus_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "polls", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "polls", ["user_id"], :name => "index_polls_on_user_id"

  create_table "polls_focus_groups", :force => true do |t|
    t.integer  "focus_group_id"
    t.integer  "poll_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "polls_focus_groups", ["poll_id", "focus_group_id"], :name => "index_polls_focus_groups_on_poll_id_and_focus_group_id"

  create_table "questions", :force => true do |t|
    t.integer  "poll_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "questions", ["poll_id"], :name => "index_questions_on_poll_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
