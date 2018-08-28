require "test_helper"

class Backend::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get backend_sessions_new_url
    assert_response :success
  end
end
