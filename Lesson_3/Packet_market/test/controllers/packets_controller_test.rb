require 'test_helper'

class PacketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get packets_index_url
    assert_response :success
  end

  test "should get show" do
    get packets_show_url
    assert_response :success
  end

  test "should get new" do
    get packets_new_url
    assert_response :success
  end

  test "should get edit" do
    get packets_edit_url
    assert_response :success
  end

end
