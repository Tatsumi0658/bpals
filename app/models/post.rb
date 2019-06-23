class Post < ApplicationRecord
  validates :images, presence: true
  mount_uploaders :images, ImageUploader
end
