require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title","いぬなび"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "お問い合わせ | いぬなび"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "いぬなびの使い方 | いぬなび"
  end

end
