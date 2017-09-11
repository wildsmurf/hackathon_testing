require 'test_helper'

class AccountssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accountss_index_url
    assert_response :success
  end

  test "should get show" do
    get accountss_show_url
    assert_response :success
  end

  test "should get new" do
    get accountss_new_url
    assert_response :success
  end

  test "should get edit" do
    get accountss_edit_url
    assert_response :success
  end

end
