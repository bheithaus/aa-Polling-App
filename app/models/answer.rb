class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :respondent, :class => User

  attr_accessible :choice_id, :respondent_id
end
