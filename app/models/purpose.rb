class Purpose < ApplicationRecord
  has_many :profile_purpose_relationships
  has_many :profiles, through: :profile_purpose_relationships
end
