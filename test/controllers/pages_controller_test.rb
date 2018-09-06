require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    puts 'all set up now'
  end

  test "should get index" do
    get pages_url
    assert_response :success
  end

  test "should get game" do
    get pages_url
    assert_response :success
  end

  test "should get blog" do
    get pages_url
    assert_response :success
  end

end
