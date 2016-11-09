class CreateKnives < ActiveRecord::Migration[5.0]
  def change
    create_table :knives do |t|
      t.string  :name
      t.integer :price	

      t.timestamps
    end
  end
end
