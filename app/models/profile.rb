class Profile < ApplicationRecord
  validates :nickname, presence: true, length:{ maximum: 30 }, uniqueness: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :product_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :profile_purpose_relationship
  has_many :purposes, through: :profile_purpose_relationship
end
