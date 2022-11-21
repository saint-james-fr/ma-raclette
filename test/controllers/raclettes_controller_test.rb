require "test_helper"

class RaclettesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get raclettes_index_url
    assert_response :success
  end

  test "should get show" do
    get raclettes_show_url
    assert_response :success
  end

  test "should get new" do
    get raclettes_new_url
    assert_response :success
  end

  test "should get create" do
    get raclettes_create_url
    assert_response :success
  end

  test "should get edit" do
    get raclettes_edit_url
    assert_response :success
  end

  test "should get update" do
    get raclettes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get raclettes_destroy_url
    assert_response :success
  end
end
