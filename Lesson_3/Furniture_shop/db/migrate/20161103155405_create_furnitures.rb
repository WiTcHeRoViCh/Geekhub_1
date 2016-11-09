class CreateFurnitures < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.string  :name
      t.string  :material
      t.integer :price	

      t.timestamps null: false
    end
  end
end
