class Authorization < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  
  attr_accessible :provider, :uid, :user_id
end
