class FacebookAuthentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :uid, :email, :first_name, :last_name, :photo, :auth_token, :expires_at, :raw_info
end
