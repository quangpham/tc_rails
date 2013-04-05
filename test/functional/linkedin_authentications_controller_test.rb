require 'test_helper'

class LinkedinAuthenticationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_create_invalid
    LinkedinAuthentication.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    LinkedinAuthentication.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to linkedin_authentications_url
  end

  def test_destroy
    linkedin_authentication = LinkedinAuthentication.first
    delete :destroy, :id => linkedin_authentication
    assert_redirected_to linkedin_authentications_url
    assert !LinkedinAuthentication.exists?(linkedin_authentication.id)
  end
end
