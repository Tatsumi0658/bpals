class AddIndexPostHashtagRelationship < ActiveRecord::Migration[5.2]
  def change
    add_index :post_hashtag_relationships, [:post_id, :hashtag_id], unique: true
  end
end
