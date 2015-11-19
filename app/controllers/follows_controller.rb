class FollowsController < ApplicationController
  before_action :logged_in_user

  def update
    follower = current_user
    followee = User.find params[:id]
    if follower.follow followee
      Activity.create_activities follower, followee, Activity::TYPES[:follow_user]
      redirect_to followee
    else
      flash[:alert] = t 'follow_message'
      redirect_to followee
    end
  end

  def destroy
    follower = current_user
    followee = User.find params[:id]
    if follower.unfollow followee
      Activity.create_activities follower, followee, Activity::TYPES[:unfollow_user]
      redirect_to followee
    else
      flash[:alert] = t 'Unfollow_message'
      redirect_to follower
    end
  end
end
