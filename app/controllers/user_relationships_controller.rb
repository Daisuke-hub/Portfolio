class UserRelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    @following = User.find(params[:user_id])
  end

  def destroy
    follow = current_user.active_relationships.where(follower_id: params[:user_id]).first
    follow.destroy
    @following = User.find(params[:user_id])
  end

  def index
    @followings = current_user.followings
  end
end
