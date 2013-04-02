class Poll < ActiveRecord::Base
  has_many :questions

  attr_accessible :user_id, :title
end
