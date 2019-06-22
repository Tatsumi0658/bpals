class Profile < ApplicationRecord
  validates :nickname, presence: true, length:{ maximum: 30 }, uniqueness: true
  mount_uploader :image, ImageUploader
end
