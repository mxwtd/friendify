require "test_helper"

class FriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friends_index_url
    assert_response :success
  end

  test "should get show" do
    get friends_show_url
    assert_response :success
  end

  test "should get edit" do
    get friends_edit_url
    assert_response :success
  end

  test "should get update" do
    get friends_update_url
    assert_response :success
  end

  test "should get destroy" do
    get friends_destroy_url
    assert_response :success
  end

  test "should get add_listing" do
    get friends_add_listing_url
    assert_response :success
  end
end
