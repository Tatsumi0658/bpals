class ChangeClumnToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :image, :string, null: false
    add_column :posts, :images, :json
  end
end
