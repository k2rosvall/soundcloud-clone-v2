class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :track

  validates :profile, :track, :content, presence: true
end
