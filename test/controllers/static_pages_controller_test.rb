require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title","ワンマップ"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "お問い合わせ | ワンマップ"
  end

end
