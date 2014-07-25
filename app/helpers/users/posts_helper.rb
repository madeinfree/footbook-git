module Users::PostsHelper
  
  def post_owner?(post, user)
    post.is_post_owner?(user)
  end

  def is_point?(post, user)
    post.is_point_owner?(post, user)
  end

end