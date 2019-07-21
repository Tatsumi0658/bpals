class Purpose < ApplicationRecord
  validates :purpose, presence: true, length:{ maximum: 30 }
  has_many :profile_purpose_relationships
  has_many :profiles, through: :profile_purpose_relationships
end
