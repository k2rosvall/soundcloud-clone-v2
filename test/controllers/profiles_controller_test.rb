# frozen_string_literal: true

require "test_helper"
class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, :with_profile)
    sign_in(@user)
  end

  test "must show profile" do
    get profile_url(@user.profile)

    assert_response :success
  end

  test "must get edit profile" do
    get edit_profile_url(@user.profile)

    assert_response :success
  end

  test "must edit profile" do
    put profile_url(@user.profile), params: { profile: { name: "Jane Doe" } }

    assert_redirected_to profile_url
    @user.profile.reload
    assert_equal "Jane Doe", @user.profile.name
  end

  test "must not return status unprocessable entity if the update throws error" do
    put profile_url(@user.profile), params: { profile: { username: nil } }

    assert_equal 422, response.status
  end
end
