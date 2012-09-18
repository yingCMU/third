class Relationship < ActiveRecord::Base
  attr_accessible :follower_id, :post_id
  belongs_to :follower, class_name: "User"
  belongs_to :post   , class_name: "Post"
  validates :follower_id, presence: true
  validates :post_id, presence: true
end
