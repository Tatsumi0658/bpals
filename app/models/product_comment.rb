class ProductComment < ApplicationRecord
  belongs_to :product
  belongs_to :profile
end
