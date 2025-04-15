class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :picture

  has_many :tracks, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :username, presence: true
end
