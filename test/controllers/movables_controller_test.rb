require "test_helper"

class MovablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movable = movables(:one)
  end

  test "should get index" do
    get movables_url
    assert_response :success
  end

  test "should get new" do
    get new_movable_url
    assert_response :success
  end

  test "should create movable" do
    assert_difference("Movable.count") do
      post movables_url, params: { movable: { categories: @movable.categories, description: @movable.description, gallery_image: @movable.gallery_image, main_image: @movable.main_image, max_rent_time: @movable.max_rent_time, min_rent_time: @movable.min_rent_time, name: @movable.name, price: @movable.price, stock: @movable.stock, user_id: @movable.user_id } }
    end

    assert_redirected_to movable_url(Movable.last)
  end

  test "should show movable" do
    get movable_url(@movable)
    assert_response :success
  end

  test "should get edit" do
    get edit_movable_url(@movable)
    assert_response :success
  end

  test "should update movable" do
    patch movable_url(@movable), params: { movable: { categories: @movable.categories, description: @movable.description, gallery_image: @movable.gallery_image, main_image: @movable.main_image, max_rent_time: @movable.max_rent_time, min_rent_time: @movable.min_rent_time, name: @movable.name, price: @movable.price, stock: @movable.stock, user_id: @movable.user_id } }
    assert_redirected_to movable_url(@movable)
  end

  test "should destroy movable" do
    assert_difference("Movable.count", -1) do
      delete movable_url(@movable)
    end

    assert_redirected_to movables_url
  end
end
