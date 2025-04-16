class FollowsController < ApplicationController
  def create
    profile = Profile.find(params[:followed_id])
    current_user.profile.follow(profile)
    redirect_to profile_path(profile)
  end

  def destroy
    profile = Follow.find(params[:id]).followed
    current_user.profile.unfollow(profile)
    redirect_to profile_path(profile)
  end
end
