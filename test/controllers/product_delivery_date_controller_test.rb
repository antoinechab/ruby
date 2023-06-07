require "test_helper"

class ProductDeliveryDateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_delivery_date_index_url
    assert_response :success
  end

  test "should get new" do
    get product_delivery_date_new_url
    assert_response :success
  end

  test "should get create" do
    get product_delivery_date_create_url
    assert_response :success
  end

  test "should get update" do
    get product_delivery_date_update_url
    assert_response :success
  end

  test "should get edit" do
    get product_delivery_date_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get product_delivery_date_destroy_url
    assert_response :success
  end
end
