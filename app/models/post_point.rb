class PostPoint < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  def is_already_point?(user, post_id)
    PostPoint.find_by(id: post_id, user_id: user.id)
  end

end
