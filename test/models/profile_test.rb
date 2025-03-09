require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  def profile
    @profile ||= build(:profile)
  end

  test "must be invalid without username" do
    profile.username = nil

    assert_not_predicate profile, :valid?
  end
end
