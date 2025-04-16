# frozen_string_literal: true

require "test_helper"
class FollowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, :with_profile)
    sign_in(@user)
  end

  test "must create follow" do
    followed_profile = create(:profile)
    assert_difference("Follow.count", 1) do
      post follows_path, params: { followed_id: followed_profile.id }
    end

    assert_redirected_to profile_path(followed_profile)
  end

  test "must destroy follow" do
    follow = create(:follow, follower: @user.profile)
    assert_difference("Follow.count", -1) do
      delete follow_path(follow)
    end

    assert_redirected_to profile_path(follow.followed)
  end
end
