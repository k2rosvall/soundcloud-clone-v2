class Follow < ApplicationRecord
  belongs_to :follower, class_name: "Profile", counter_cache: :following_count
  belongs_to :followed, class_name: "Profile", counter_cache: :followers_count

  validates :follower, :followed, presence: true
  validates :follower, uniqueness: { scope: :followed }
end
