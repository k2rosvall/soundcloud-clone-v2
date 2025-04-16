class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :picture

  has_many :tracks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :followed_profiles, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :follower_profiles, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :followed_profiles, source: :followed
  has_many :followers, through: :follower_profiles, source: :follower

  validates :username, presence: true

  def follow(followed_profile)
    followed_profiles.create(followed: followed_profile)
  end

  def unfollow(followed_profile)
    followed_profiles.find_by(followed: followed_profile).destroy
  end

  def following?(profile)
    following.include?(profile)
  end
end
