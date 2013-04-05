require 'test_helper'

class FacebookAuthenticationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert FacebookAuthentication.new.valid?
  end
end
