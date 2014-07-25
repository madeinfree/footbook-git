class PlazasController < ApplicationController

  before_action :user_login?

  def index
    @posts = Post.order(created_at: :desc)
  end
  
end
