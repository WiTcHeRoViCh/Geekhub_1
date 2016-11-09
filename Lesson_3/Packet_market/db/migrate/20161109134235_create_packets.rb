class CreatePackets < ActiveRecord::Migration[5.0]
  def change
    create_table :packets do |t|
      t.string  :name
      t.integer :price	

      t.timestamps
    end
  end
end
