class Poll < ActiveRecord::Base
  has_many :questions
  has_many :answers, :through => :questions
  has_many :respondents, :through => :answers

  belongs_to :user

  attr_accessible :user_id, :title

  validates :user_id, :title, :presence => true

  def responses
    # { :question1 => { :choice1 => count, :choice2 => count } ..etc }
    questions = self.questions
        .includes(:choices => :answers ).all

    poll_response = {}

    questions.each do |question|
      poll_response[question.body] = {}
      question.choices.each do |choice|
        poll_response[question.body][choice.body] = choice.answers.size
      end
    end

    poll_response
  end
end
