class AddSecretToLinkedinAuthentication < ActiveRecord::Migration
  def change
    add_column :linkedin_authentications, :secret, :string
  end
end
