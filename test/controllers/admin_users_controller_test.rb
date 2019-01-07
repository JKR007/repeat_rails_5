require 'test_helper'

class AdminUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_users_controller_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_users_controller_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_users_controller_edit_url
    assert_response :success
  end

  test "should get delete" do
    get admin_users_controller_delete_url
    assert_response :success
  end
end
