class User < ActiveRecord::Base
  has_many :polls
  ##how to set up has_many :answers, as respondent

  validates :email, :name, :presence => true

  attr_accessible :email, :name
end
