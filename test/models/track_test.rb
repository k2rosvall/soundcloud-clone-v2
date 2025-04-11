require "test_helper"

class TrackTest < ActiveSupport::TestCase
  def track
    @track ||= build(:track)
  end

  test "must be invalid without name" do
    track.name = nil

    assert_not_predicate track, :valid?
  end

  test "must be invalid without file" do
    track.file.purge

    assert_not_predicate track, :valid?
  end
end
