class Like < ApplicationRecord
  belongs_to :profile
  belongs_to :track

  validates :profile_id, uniqueness: { scope: :track_id }
  validates :profile, :track, presence: true
end
