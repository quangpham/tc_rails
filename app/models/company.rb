class Company < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :city, :country, :description, :email_address, :facebook_id, :industry, :linkedin_id, :name, :phone_number, :postcode, :twitter_id, :website, :user_id
end
