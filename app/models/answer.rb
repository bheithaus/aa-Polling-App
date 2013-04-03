class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :respondent, :class_name => "User"
  has_one :question, :through => :choice

  validate :validate_unique_answer,
           :validate_respondent_is_not_creator,
           :validate_allowed_focus_group

  attr_accessible :choice_id, :respondent_id

  def sibling_answers
    self.question.answers.where("answers.id != ?", self.id)
  end

  def validate_unique_answer
    unless sibling_answers
        .where("respondent_id = ?", self.respondent_id)
        .count == 0

       errors[:respondent_id] << "You already answered this question"
    end
  end

  def validate_respondent_is_not_creator
    unless self
        .question
        .poll
        .user_id != self.respondent_id

      errors[:respondent_id] << "You cannot respond to your own poll"
    end
  end

  def validate_allowed_focus_group
    polls_focus_groups = self.question.poll.focus_groups
    return true if polls_focus_groups.empty?
    users_focus_groups = User.find(self.respondent_id).focus_groups
    allowed = polls_focus_groups.any? do |poll_fg|
                   users_focus_groups.any? do |user_fg|  #FIXED: had to be                                                            nested any? methods :)
                    user_fg.id == poll_fg.id
                  end
                end

      unless allowed
        errors[:respondent_id] << "You're not in this focus group"
      end
  end
end
