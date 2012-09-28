class Post < ActiveRecord::Base
  attr_accessible :details, :place, :time, :title, :user_id
  validates :user_id, presence: true
  validates :title, presence: true
  belongs_to :user
  has_many :reverse_relationships   , foreign_key: "post_id",    class_name:  "Relationship",     dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
end
