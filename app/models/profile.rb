class Profile < ApplicationRecord
  belongs_to :user

  has_many :tracks, dependent: :destroy
  has_one_attached :picture

  validates :username, presence: true
end
