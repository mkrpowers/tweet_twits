require 'test_helper'

class TwitcenterControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get twitcenter_feed_url
    assert_response :success
  end

  test "should get show_user" do
    get twitcenter_show_user_url
    assert_response :success
  end

  test "should get now_following" do
    get twitcenter_now_following_url
    assert_response :success
  end

  test "should get unfollow" do
    get twitcenter_unfollow_url
    assert_response :success
  end

end
