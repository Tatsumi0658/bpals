class Product < ApplicationRecord
  validates :name, presence: true, length:{ maximum: 50 }
  validates :description, length: { maximum: 300 }
  validates :product_images, presence: true
  mount_uploaders :product_images, ImageUploader
  has_many :product_comments, dependent: :destroy

  scope :search_name, ->(word){ where('name LIKE ?', "%#{word}%") }
end
