class Question < ActiveRecord::Base
  belongs_to :poll
  has_many :choices
  # SELECT *
  #   FROM choices
  #  WHERE choices.question_id = #{self.id}
  has_many :answers, :through => :choices
  #     SELECT 'answers'.*
  #       FROM choices
  # INNER JOIN answers
  #         ON choices.answer_id = answers.id
  #      WHERE choices.question_id = #{self.id}

  validates :body, :presence => true, :length => { :maximum => 10000 }

  attr_accessible :body, :poll_id
end
