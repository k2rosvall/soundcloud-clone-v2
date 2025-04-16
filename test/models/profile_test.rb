require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  def profile
    @profile ||= build(:profile)
  end

  test "must be invalid without username" do
    profile.username = nil

    assert_not_predicate profile, :valid?
  end

  test "must follow a profile" do
    profile_following = create(:profile)
    profile_to_follow = create(:profile)

    assert_difference("Follow.count", 1) do
      profile_following.follow(profile_to_follow)
    end
  end

  test "must unfollow a profile" do
    profile_following = create(:profile)
    profile_to_unfollow = create(:profile)
    create(:follow, followed: profile_to_unfollow, follower: profile_following)

    assert_difference("Follow.count", -1) do
      profile_following.unfollow(profile_to_unfollow)
    end
  end

  test "must return true if profile is following another profile" do
    profile_following = create(:profile)
    profile_followed = create(:profile)
    create(:follow, followed: profile_followed, follower: profile_following)

    assert_equal profile_following.following?(profile_followed), true
  end

  test "must return false if profile is not following another profile" do
    profile_following = create(:profile)
    profile_followed = create(:profile)

    assert_equal profile_following.following?(profile_followed), false
  end
end
