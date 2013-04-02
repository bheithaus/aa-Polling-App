class User < ActiveRecord::Base
  has_many :polls

  validates :email, :name, :presence => true

  attr_accessible :email, :name
end
