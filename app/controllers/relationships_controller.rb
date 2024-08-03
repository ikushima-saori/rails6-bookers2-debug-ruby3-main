class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to  request.referer
  end

  def follower_user
    user = User.find(params[:user_id])
    @users = user.follower_user
  end

  def followed_user
    user = User.find(params[:user_id])
    @users = user.followed_user
  end

end
