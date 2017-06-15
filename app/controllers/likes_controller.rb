class LikesController < ApplicationController

  def new
  end

  def create
    Like.create(secret: Secret.find(params[:id]), user: current_user)
    redirect_to '/secrets'
  end

  def destroy
    Like.find_by(secret: Secret.find(params[:id]), user: current_user).destroy
    redirect_to '/secrets'
  end
end
