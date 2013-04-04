class Company < ActiveRecord::Base
  attr_accessible :address, :city, :country, :description, :email_address, :facebook_id, :industry, :linkedin_id, :name, :phone_number, :postcode, :twitter_id, :website
end
