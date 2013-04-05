class CreateFacebookAuthentications < ActiveRecord::Migration
  def self.up
    create_table :facebook_authentications do |t|
      t.integer :user_id
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :auth_token
      t.date :expires_at
      t.text :raw_info
      t.timestamps
    end
  end

  def self.down
    drop_table :facebook_authentications
  end
end
