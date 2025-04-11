require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def like
    @like ||= build(:like)
  end

  test "must be invalid without profile" do
    like.profile = nil

    assert_not_predicate like, :valid?
  end

  test "must be invalid without track" do
    like.track = nil

    assert_not_predicate like, :valid?
  end

  test "must be one per profile per track" do
    profile = create(:profile)
    track = create(:track)
    create(:like, profile: profile, track: track)
    like = build(:like, profile: profile, track: track)

    assert_not_predicate like, :valid?
  end
end
