class Product < ApplicationRecord
  validates :name, presence: true
  mount_uploaders :product_images, ImageUploader
end
