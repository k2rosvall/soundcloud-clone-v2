class Profile < ApplicationRecord
  belongs_to :user

  has_many :tracks, dependent: :destroy

  validates :username, presence: true
end
