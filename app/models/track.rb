class Profile < ApplicationRecord
  belongs_to :profile

  validates :name, presence: true
end
