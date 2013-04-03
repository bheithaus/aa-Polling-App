class FocusGroup < ActiveRecord::Base
  has_many :assigments
  has_many :polls_focus_groups

  has_many :users, :through => :assigments
  has_many :polls, :though => :polls_focus_groups

  attr_accessible :name
end
