class ProductComment < ApplicationRecord
  belongs_to :product
  belongs_to :profile
  validates :content, presence: true, length:{ maximum: 200 }
end
