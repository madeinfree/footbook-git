class Users::PostsController < ApplicationController

  before_action :user_login?

  def new
    
  end

  def create
    @post = current_user.posts.build(post_strong_params)

    if @post.save
    else
      flash[:error] = "輸入空白或不正確"
    end
    redirect_to root_path
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    
    redirect_to root_path
  end

  def bad_point
    @point = current_user.post_points.build
    @point.post_id = params[:id]
    unless @point.is_already_point?(current_user, @point.post_id)
      @point.save
    end
    redirect_to root_path
  end

  def bad_point_destroy
    @point = PostPoint.find_by(post: params[:id], user_id: current_user.id)
    @point.destroy
    redirect_to root_path
  end

  private
  def post_strong_params
    params.require(:post).permit(:text)
  end
  
end
