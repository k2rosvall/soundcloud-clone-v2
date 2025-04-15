require "test_helper"

class FollowTest < ActiveSupport::TestCase
  def follow
    @follow ||= build(:follow)
  end

  test "must be invalid without follower" do
    follow.follower = nil

    assert_not_predicate follow, :valid?
  end

  test "must be invalid without followed" do
    follow.followed = nil

    assert_not_predicate follow, :valid?
  end

  test "must be only one follow per follower and followed" do
    follower = create(:profile)
    followed = create(:profile)
    create(:follow, follower: follower, followed: followed)
    follow = build(:follow, follower: follower, followed: followed)

    assert_not_predicate follow, :valid?
  end
end
