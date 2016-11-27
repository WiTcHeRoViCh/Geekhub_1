class CreateCups < ActiveRecord::Migration[5.0]
  def change
    create_table :cups do |t|
      t.string  :name
      t.integer :price
      t.belongs_to :user, index: true	

      t.timestamps
    end
    add_foreign_key :posts, :users
  end
end
