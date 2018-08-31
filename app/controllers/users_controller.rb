class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @blogs = user.blogs.order("created_at DESC")
  end
end

