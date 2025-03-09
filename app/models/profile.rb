class Profile < ApplicationRecord
  belongs_to :user

  validates :username, presence: true
end
