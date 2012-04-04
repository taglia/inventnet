class Idea < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  attr_accessible :content, :title
end
