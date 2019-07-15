class ProfilePurposeRelationship < ApplicationRecord
  belongs_to :profile
  belongs_to :purpose
end
