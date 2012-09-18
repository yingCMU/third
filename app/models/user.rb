class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
 # has_many :microposts  ,foreign_key: "user_id",  dependent: :destroy
  has_many :posts ,  dependent: :destroy
  has_many :relationships   ,  foreign_key: "follower_id",         dependent: :destroy
  has_many :following_posts, through: :relationships, source: :post
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

     #test
  has_many :microposts, dependent: :destroy
  has_many :relationship1s, foreign_key: "follower_id", dependent: :destroy


  has_many :followed_users, through: :relationship1s, source: :followed
  def following?(other_user)
    relationship1s.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationship1s.create!(followed_id: other_user.id)
  end

  has_many :reverse_relationship1s, foreign_key: "followed_id",
           class_name:  "Relationship1",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationship1s, source: :follower
  #test

 # def following?(any_post)
  #  relationships.find_by_post_id(any_post.id)
  #end

 # def follow!(any_post)
 #   relationships.create!(post_id: any_post.id)
  #end

  def unfollow!(any_post)
    relationships.find_by_post_id(any_post.id).destroy
  end
end
