class LinkedinAuthentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :uid, :email, :first_name, :last_name, :photo, :description, :headline, :industry, :location, :phone, :raw_info
end
