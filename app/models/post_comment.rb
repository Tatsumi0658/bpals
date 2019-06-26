class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :profile
  validates :content, presence: true, length:{ maximum: 200 }
end
