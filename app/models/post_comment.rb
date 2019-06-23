class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :profile
end
