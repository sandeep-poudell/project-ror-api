require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_index_url
    assert_response :success
  end

  test "should get show" do
    get posts_show_url
    assert_response :success
  end

  test "should get create" do
    get posts_create_url
    assert_response :success
  end

  test "should get update" do
    get posts_update_url
    assert_response :success
  end

  test "should get publish" do
    get posts_publish_url
    assert_response :success
  end

  test "should get unpublish" do
    get posts_unpublish_url
    assert_response :success
  end

  test "should get destroy" do
    get posts_destroy_url
    assert_response :success
  end

  test "should get comment" do
    get posts_comment_url
    assert_response :success
  end
end
