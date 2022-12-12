require "test_helper"

class AboutUsControllerTest < ActionDispatch::IntegrationTest
  test "should get about_us" do
    get about_us_about_us_url
    assert_response :success
  end
end
