class AddIndexToPost < ActiveRecord::Migration[5.2]
  def change
    add_index :posts, :updated_at, order:{ updated_at: :desc }
  end
end
