class LinkedinAuthenticationsController < ApplicationController
  def index
    @linkedin_authentications = current_user.linkedin_authentication if current_user
  end

  def create
    @linkedin_authentication = LinkedinAuthentication.new(params[:linkedin_authentication])
    if @linkedin_authentication.save
      redirect_to linkedin_authentications_url, :notice => "Successfully created linkedin authentication."
    else
      render :action => 'new'
    end
  end

  def destroy
    @linkedin_authentication = current_user.linkedin_authentication
    @linkedin_authentication.destroy
    redirect_to edit_user_registration_url, :notice => "Successfully destroyed linkedin authentication."
  end
end
