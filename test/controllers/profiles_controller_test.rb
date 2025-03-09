# frozen_string_literal: true

require "test_helper"
class ProfilesControllerTest < ActionDispatch::IntegrationTest
  def user
    @user ||= create(:user, :with_profile)
  end

  setup do
    sign_in(user)
  end

  test "must show profile" do
    get profile_url

    assert_response :success
  end

  test "must get edit profile" do
    get edit_profile_url

    assert_response :success
  end

  test "must edit profile" do
    put profile_url, params: { profile: { name: "Jane Doe" } }

    assert_redirected_to profile_url
    assert_equal "Jane Doe", user.profile.name
  end

  test "must not return status unprocessable entity if the update throws error" do
    put profile_url, params: { profile: { username: nil } }

    assert_equal 422, response.status
  end
end