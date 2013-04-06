class AddTokenToLinkedinAuthentication < ActiveRecord::Migration
  def change
    add_column :linkedin_authentications, :token, :string
  end
end
