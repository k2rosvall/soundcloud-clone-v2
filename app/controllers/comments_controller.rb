class CommentsController < ApplicationController
  before_action :set_track
  before_action :set_comment, only: :destroy

  def create
      comment = current_user.profile.comments.new(comments_params)
      comment.track = @track
    if comment.save
      redirect_to profile_track_path(@track.profile, @track), notice: t("controllers.create.success", model: "Comment")
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to profile_track_path(@track.profile, @track), notice: t("controllers.destroy.success", model: "Comment")
  end

  private

  def set_track
    @track = Track.find(params[:track_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:content)
  end
end
