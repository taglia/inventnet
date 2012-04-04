class Idea < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :content, :title
end
