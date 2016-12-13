class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.belongs_to :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
