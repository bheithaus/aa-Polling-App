class Question < ActiveRecord::Base
  belongs_to :poll
  has_many :choices
  has_many :answers, :through => :choices
  validates :body, :presence => true, :length => { :maximum => 10000 }

  attr_accessible :body, :poll_id
end
