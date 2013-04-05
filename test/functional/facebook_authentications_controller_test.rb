require 'test_helper'

class FacebookAuthenticationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_create_invalid
    FacebookAuthentication.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    FacebookAuthentication.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to facebook_authentications_url
  end

  def test_destroy
    facebook_authentication = FacebookAuthentication.first
    delete :destroy, :id => facebook_authentication
    assert_redirected_to facebook_authentications_url
    assert !FacebookAuthentication.exists?(facebook_authentication.id)
  end
end
