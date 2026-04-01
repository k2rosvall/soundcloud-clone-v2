# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    @user.build_profile
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ profile_attributes: [ :username ] ])
  end
end
