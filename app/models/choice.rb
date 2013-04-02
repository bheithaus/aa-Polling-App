class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  validates :body, :presence => true, :length => { :maximum => 500 }

  attr_accessible :body, :question_id
end
