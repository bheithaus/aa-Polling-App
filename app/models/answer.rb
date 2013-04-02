class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :respondent, :class_name => "User"

  validate :validate_unique_answer

  attr_accessible :choice_id, :respondent_id

  def validate_unique_answer
    self.choice
        .question
        .answers
        .where("respondent_id = ?", self.respondent_id)
        .count == 0
  end
end
