class LikesController < ApplicationController
  before_action :set_track, only: :create
  before_action :set_like, only: :destroy

  def create
    if current_user.profile.likes.create(track: @track)
      redirect_to profile_track_path(current_user.profile, @track), notice: t("controllers.create.success", model: "Like")
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @like.destroy
    redirect_to profile_path(current_user.profile), notice: t("controllers.destroy.success", model: "Like")
  end

  private

  def set_track
    @track = Track.find(params[:track_id])
  end

  def set_like
    @like = Like.find(params[:id])
  end
end
