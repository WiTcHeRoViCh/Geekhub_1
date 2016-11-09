require 'test_helper'

class MeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meats_index_url
    assert_response :success
  end

  test "should get show" do
    get meats_show_url
    assert_response :success
  end

  test "should get new" do
    get meats_new_url
    assert_response :success
  end

  test "should get edit" do
    get meats_edit_url
    assert_response :success
  end

end
