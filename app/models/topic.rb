class Topic < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :ideas, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :users, through: :roles

  attr_accessible :abstract, :title

  validates_presence_of :title, :owner
  
  def self.find_by_authorized_user(user)
    roles = Role.where user_id: user.id

    result = self.where(owner_id: user.id)
    roles.each do |r|
      result << self.where(id: r.topic_id)
    end
    
    result

  end
  
  def user_authorized?(user)
    if self.owner == user || self.users.include?(user)
      true
    else
      false
    end
  end

end
