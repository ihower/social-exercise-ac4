class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name
      t.string :email

      t.string :fb_uid
      t.string :fb_image
      t.string :fb_token

      t.datetime :fb_expires_at

      t.timestamps null: false
    end

    add_index :users, :fb_uid, :unique => true

  end

end
