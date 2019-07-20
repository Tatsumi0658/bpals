class AddCascadeToTables < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :post_comments, :posts
    remove_foreign_key :post_comments, :profiles
    remove_foreign_key :post_hashtag_relationships, :hashtags
    remove_foreign_key :post_hashtag_relationships, :posts
    remove_foreign_key :posts, :profiles
    remove_foreign_key :product_comments, :products
    remove_foreign_key :product_comments, :profiles
    remove_foreign_key :profile_purpose_relationships, :profiles
    remove_foreign_key :profile_purpose_relationships, :purposes
    remove_foreign_key :profiles, :users
    add_foreign_key :post_comments, :posts, on_delete: :cascade
    add_foreign_key :post_comments, :profiles, on_delete: :cascade
    add_foreign_key :post_hashtag_relationships, :hashtags, on_delete: :cascade
    add_foreign_key :post_hashtag_relationships, :posts, on_delete: :cascade
    add_foreign_key :posts, :profiles, on_delete: :cascade
    add_foreign_key :product_comments, :products, on_delete: :cascade
    add_foreign_key :product_comments, :profiles, on_delete: :cascade
    add_foreign_key :profile_purpose_relationships, :profiles, on_delete: :cascade
    add_foreign_key :profile_purpose_relationships, :purposes, on_delete: :cascade
    add_foreign_key :profiles, :users, on_delete: :cascade
  end
end
