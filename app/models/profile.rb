class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :picture

  has_many :tracks, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :followed_profiles, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :follower_profiles, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :followed_profiles, source: :followed
  has_many :followers, through: :follower_profiles, source: :follower

  validates :username, presence: true
end
