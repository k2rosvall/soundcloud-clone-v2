class Track < ApplicationRecord
  belongs_to :profile

  has_one_attached :file
  has_one_attached :artwork

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, :file, presence: true
end
