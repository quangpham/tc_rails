class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    # raise request.env["omniauth.auth"].to_yaml
    user = User.from_omniauth(request.env["omniauth.auth"])
    
    # Controll if the user is signin successfull or not
    if user.persisted?
      sign_in_and_redirect user, notice: "Signed in!"
    else
      session["devise.user_attributes"] = user.attributes
      #raise "shit".to_yaml
      redirect_to new_user_registration_url
    end
    
  end
  
  alias_method :facebook, :all

end
