class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :microposts  ,  dependent: :destroy
  has_many :posts ,  dependent: :destroy
  has_many :relationships   ,  foreign_key: "follower_id",         dependent: :destroy
  has_many :following_posts, through: :relationships, source: :post
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

     #test





  def following?(this_post)
    relationships.find_by_post_id(this_post.id)
  end
     #
  def follow!(this_post)
    relationships.create!(post_id: this_post.id)
  end


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
