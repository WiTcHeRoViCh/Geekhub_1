require 'test_helper'

class KnivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get knives_index_url
    assert_response :success
  end

  test "should get show" do
    get knives_show_url
    assert_response :success
  end

  test "should get new" do
    get knives_new_url
    assert_response :success
  end

  test "should get edit" do
    get knives_edit_url
    assert_response :success
  end

end
