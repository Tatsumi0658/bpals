class Profile < ApplicationRecord
  validates :nickname, presence: true, length:{ maximum: 30 }, uniqueness: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :product_comments, dependent: :destroy
end
