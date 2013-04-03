class User < ActiveRecord::Base
  has_many :polls
  has_many :answers, :foreign_key => :respondent_id
  has_many :assignments
  has_many :focus_groups, :through => :assignments

  validates :email, :name, :presence => true

  attr_accessible :email, :name
end
