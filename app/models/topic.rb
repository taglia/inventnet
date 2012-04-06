class Topic < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :ideas, dependent: :nullify
  has_many :roles, dependent: :destroy
  has_many :users, through: :roles

  attr_accessible :abstract, :title

  validates_presence_of :title, :owner

end
