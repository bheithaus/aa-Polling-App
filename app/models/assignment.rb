class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :focus_group

  attr_accessible :focus_group_id, :user_id
end
