class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.json :product_images
      t.text :description

      t.timestamps
    end
  end
end
