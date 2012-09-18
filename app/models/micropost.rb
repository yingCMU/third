class Micropost < ActiveRecord::Base
 # attr_accessible :content, :user_id
  attr_accessible :content
  belongs_to :user

  validates :user_id, presence: true
end
