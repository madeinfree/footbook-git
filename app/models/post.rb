class Post < ActiveRecord::Base
  belongs_to :user

  has_many :post_points, :dependent => :destroy
  
  has_many :users

  has_many :comments

  validates :text, presence: true

  belongs_to :owner, :class_name => "User", :foreign_key => :user_id

  def is_post_owner?(user)
    user && user == owner
  end

  def is_point_owner?(post, user)
    PostPoint.find_by(post_id: post.id, user_id: user.id)
  end

end