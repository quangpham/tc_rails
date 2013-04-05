class CreateLinkedinAuthentications < ActiveRecord::Migration
  def self.up
    create_table :linkedin_authentications do |t|
      t.integer :user_id
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :description
      t.string :headline
      t.string :industry
      t.string :location
      t.string :phone
      t.text :raw_info
      t.timestamps
    end
  end

  def self.down
    drop_table :linkedin_authentications
  end
end
