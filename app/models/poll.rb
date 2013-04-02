class Poll < ActiveRecord::Base
  has_many :questions
  # SELECT *
  #  FROM  questions
  # WHERE  poll_id = #{self.id}

  has_many :answers, :through => :questions
  #     SELECT 'answers'.*
  #       FROM questions
  # INNER JOIN choices
  #         ON questions.id = choices.question_id
  # INNER JOIN answers
  #         ON choices.id = answers.choice_id
  #      WHERE questions.poll_id = #{self.id}

  has_many :respondents, :through => :answers
  #     SELECT 'respondents'.*
  #       FROM answers
  # INNER JOIN users
  #         ON answers.respondent_id = user.id
  # INNER JOIN choices
  #         ON answers.choice_id = choices.id
  # INNER JOIN questions
  #         ON choices.question_id = questions.id
  #      WHERE questions.poll_id = #{self.id}

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
