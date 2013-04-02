class User < ActiveRecord::Base
  has_many :polls
  has_many :answers, :foreign_key => :respondent_id

  validates :email, :name, :presence => true

  attr_accessible :email, :name
end
