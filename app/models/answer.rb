class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :respondent, :class_name => "User"

  validate :validate_unique_answer,
           :validate_respondent_is_not_creator

  attr_accessible :choice_id, :respondent_id

  def validate_unique_answer
    unless self.choice
        .question
        .answers
        .where("respondent_id = ?", self.respondent_id)
        .count == 0

       errors[:already_answered] << "You already answered this question"
    end
  end

  def validate_respondent_is_not_creator
    unless self.choice
        .question
        .poll
        .user_id != self.respondent_id

      errors[:own_poll] << "You cannot respond to your own poll"
    end
  end
end
