class BlogsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @users = User.all
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(text: blog_params[:text], user_id: current_user.id)
    redirect_to "/users/#{current_user.id}/"
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
       blog.destroy
    end
    redirect_to "/users/#{current_user.id}/"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
    redirect_to "/users/#{current_user.id}/"
  end

  private
  def blog_params
    params.require(:blog).permit(:text, :id)
  end

  def move_to_index
    redirect_to :action => "index" unless user_signed_in?
  end

end
