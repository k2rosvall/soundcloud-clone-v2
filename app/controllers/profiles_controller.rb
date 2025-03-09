class ProfilesController < ApplicationController
  before_action :set_profile

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: t("controllers.update.success", model: "Profile")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :username, :bio)
  end
end
