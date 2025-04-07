class Track < ApplicationRecord
  belongs_to :profile

  has_one_attached :file
  has_one_attached :artwork

  validates :name, presence: true
end
