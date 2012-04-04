class Topic < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :users, through: :roles
  attr_accessible :abstract, :title
end
