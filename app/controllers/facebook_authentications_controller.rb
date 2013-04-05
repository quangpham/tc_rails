class FacebookAuthenticationsController < ApplicationController
  def index
    @facebook_authentications = current_user.facebook_authentications if current_user
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
    @facebook_authentication = current_user.facebook_authentications.find(params[:id])
    @facebook_authentication.destroy
    redirect_to facebook_authentications_url, :notice => "Successfully destroyed facebook authentication."
  end
end
