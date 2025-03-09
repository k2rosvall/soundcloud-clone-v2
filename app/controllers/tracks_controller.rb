class TracksController < ApplicationController
  before_action :set_profile
  before_action :set_track, only: %i[show edit update destroy]

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def show; end

  def edit; end

  def create
    @track = current_user.profile.tracks.new(track_params)

    if @track.save
      redirect_to track_path(@track), notice: t("controllers.create.success", model: "Track")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @track.update(track_params)
      redirect_to profile_track_path, notice: t("controllers.update.success", model: "Track")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def set_track
    @track = @profile.tracks.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:name, :description)
  end
end
