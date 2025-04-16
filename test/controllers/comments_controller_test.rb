# frozen_string_literal: true

require "test_helper"
class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, :with_profile)
    sign_in(@user)
  end

  test "must create comment" do
    track = create(:track)
    assert_difference("Comment.count", 1) do
      post comments_path, params: { track_id: track.id, comment: { content: "Awesome track!" } }
    end

    assert_redirected_to profile_track_path(track.profile, track)
  end

  test "must destroy comment" do
    track = create(:track)
    comment = create(:comment, track: track, profile: @user.profile)
    assert_difference("Comment.count", -1) do
      delete comment_path(comment), params: { track_id: track.id }
    end

    assert_redirected_to profile_track_path(track.profile, track)
  end
end
