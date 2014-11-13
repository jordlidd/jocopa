require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
 
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
