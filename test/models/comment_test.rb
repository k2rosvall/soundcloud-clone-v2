require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def comment
    @comment ||= build(:comment)
  end

  test "must be invalid without profile" do
    comment.profile = nil

    assert_not_predicate comment, :valid?
  end

  test "must be invalid without track" do
    comment.track = nil

    assert_not_predicate comment, :valid?
  end

  test "must be invalid without content" do
    comment = build(:comment, content: nil)

    assert_not_predicate comment, :valid?
  end
end
