require 'test_helper'

class Account::FriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_friends_index_url
    assert_response :success
  end

end
