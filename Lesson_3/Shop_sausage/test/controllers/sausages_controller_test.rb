require 'test_helper'

class SausagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sausages_index_url
    assert_response :success
  end

  test "should get show" do
    get sausages_show_url
    assert_response :success
  end

  test "should get new" do
    get sausages_new_url
    assert_response :success
  end

  test "should get edit" do
    get sausages_edit_url
    assert_response :success
  end

end
