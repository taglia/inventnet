class Idea < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  attr_accessible :content, :title

  validates_presence_of :topic, :user, :title
end
