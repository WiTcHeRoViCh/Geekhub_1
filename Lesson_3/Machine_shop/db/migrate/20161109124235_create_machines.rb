class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.string  :name
      t.integer :price

      t.timestamps
    end
  end
end
