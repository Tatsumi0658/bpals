class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
      t.text :content, null: false
      t.references :product, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
