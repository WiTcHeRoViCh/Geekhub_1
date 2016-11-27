class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string  :country
      t.string  :sex
      t.string  :avatar
      t.integer :user_id

      t.timestamps
    end
    
  end
end
