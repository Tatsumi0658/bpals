class Product < ApplicationRecord
  validates :name, presence: true
  mount_uploaders :product_images, ImageUploader
  has_many :product_comments, dependent: :destroy
end
