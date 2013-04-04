class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :linkedin_id
      t.string :facebook_id
      t.string :twitter_id
      t.string :address
      t.string :postcode
      t.string :city
      t.string :country
      t.string :phone_number
      t.string :email_address
      t.string :website
      t.string :industry

      t.timestamps
    end
  end
end
