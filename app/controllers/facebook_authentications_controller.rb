class FacebookAuthenticationsController < ApplicationController
  def index
    @facebook_authentication = current_user.facebook_authentication if current_user
  end

  def create
    @facebook_authentication = FacebookAuthentication.new(params[:facebook_authentication])
    if @facebook_authentication.save
      redirect_to facebook_authentications_url, :notice => "Successfully created facebook authentication."
    else
      render :action => 'new'
    end
  end

  def destroy
    @facebook_authentication = current_user.facebook_authentication
    @facebook_authentication.destroy
    redirect_to facebook_authentications_url, :notice => "Successfully destroyed facebook authentication."
  end
end
