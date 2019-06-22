class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nickname, null: false, uniqueness: true
      t.string :image
      t.integer :age
      t.integer :skintype
      t.integer :purpose

      t.timestamps
    end
  end
end
