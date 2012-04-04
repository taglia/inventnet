class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  # attr_accessible :title, :body
end
