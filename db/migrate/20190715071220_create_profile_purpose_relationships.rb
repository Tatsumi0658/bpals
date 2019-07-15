class CreateProfilePurposeRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_purpose_relationships do |t|
      t.references :profile, foreign_key: true
      t.references :purpose, foreign_key: true

      t.timestamps
    end
  end
end
