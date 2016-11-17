require 'test_helper'

class WeaponControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weapon_index_url
    assert_response :success
  end

  test "should get show" do
    get weapon_show_url
    assert_response :success
  end

  test "should get new" do
    get weapon_new_url
    assert_response :success
  end

  test "should get edit" do
    get weapon_edit_url
    assert_response :success
  end

end
