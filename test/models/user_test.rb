require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(email: "admin@example.com")
  end

  test "test check email" do
    @user.email = " "
    assert_not @user.valid?, "You need valid email"
  end
end
