class Users::CommentsController < ApplicationController

  before_action :user_login?
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_strong_params)
    @comment.user_id = current_user.id
    @comment.save

    redirect_to root_path
  end

  def comment_strong_params
    params.require(:comments).permit(:text)
  end
end
