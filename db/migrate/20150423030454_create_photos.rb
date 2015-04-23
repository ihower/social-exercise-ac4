class CreatePhotos < ActiveRecord::Migration

  def change
    create_table :photos do |t|

      t.string :title

      t.integer :user_id, :index => true
      t.timestamps null: false
    end

    add_attachment :photos, :image

  end

end
