require 'test_helper'

class LinkedinAuthenticationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert LinkedinAuthentication.new.valid?
  end
end
