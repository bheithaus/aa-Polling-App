class PollsFocusGroup < ActiveRecord::Base
  belongs_to :focus_group
  belongs_to :poll

  attr_accessible :focus_group_id, :poll_id
end
