class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :photo_id, :index => true, :null => false
      t.integer :user_id, :index => true
      t.text :content
      t.timestamps null: false
    end
  end
end
