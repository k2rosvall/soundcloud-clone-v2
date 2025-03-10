class ProfilesController < ApplicationController
  before_action :set_profile

  def index 
    @profiles = Profile.all
  end

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: t("controllers.update.success", model: "Profile")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :username, :bio)
  end
end
