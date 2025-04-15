# frozen_string_literal: true

require "test_helper"
class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, :with_profile)
    sign_in(@user)
  end

  test "must create like" do
    track = create(:track)
    assert_difference("Like.count", 1) do
      post likes_path, params: { track_id: track.id }
    end

    assert_redirected_to profile_track_path(@user.profile, track)
  end

  test "must destroy like" do
    like = create(:like)
    assert_difference("Like.count", -1) do
      delete like_path(like)
    end

    assert_redirected_to profile_path(@user.profile)
 1 end
end
