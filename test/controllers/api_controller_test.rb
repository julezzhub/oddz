require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get test_api" do
    get api_test_api_url
    assert_response :success
  end

end
