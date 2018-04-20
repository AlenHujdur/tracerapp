require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "the truth is that users index has page(url)" do
    get users_index_url  
    assert_response :success
  end
end
