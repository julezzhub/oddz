require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get search_new_url
    assert_response :success
  end

  test "should get create" do
    get search_create_url
    assert_response :success
  end

end
