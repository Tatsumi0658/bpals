class Hashtag < ApplicationRecord
  has_many :post_hashtag_relationships, through: :post_hashtag_relationships, source: :posts
end
