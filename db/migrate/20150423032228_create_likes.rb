class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|

      t.integer :photo_id, :index => true, :null => false
      t.integer :user_id, :index => true, :null => false

      t.timestamps null: false
    end

    add_column :photos, :likes_count, :integer, :default => 0
  end
end
