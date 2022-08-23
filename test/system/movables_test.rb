require "application_system_test_case"

class MovablesTest < ApplicationSystemTestCase
  setup do
    @movable = movables(:one)
  end

  test "visiting the index" do
    visit movables_url
    assert_selector "h1", text: "Movables"
  end

  test "should create movable" do
    visit movables_url
    click_on "New movable"

    fill_in "Categories", with: @movable.categories
    fill_in "Description", with: @movable.description
    fill_in "Gallery image", with: @movable.gallery_image
    fill_in "Main image", with: @movable.main_image
    fill_in "Max rent time", with: @movable.max_rent_time
    fill_in "Min rent time", with: @movable.min_rent_time
    fill_in "Name", with: @movable.name
    fill_in "Price", with: @movable.price
    fill_in "Stock", with: @movable.stock
    fill_in "User", with: @movable.user_id
    click_on "Create Movable"

    assert_text "Movable was successfully created"
    click_on "Back"
  end

  test "should update Movable" do
    visit movable_url(@movable)
    click_on "Edit this movable", match: :first

    fill_in "Categories", with: @movable.categories
    fill_in "Description", with: @movable.description
    fill_in "Gallery image", with: @movable.gallery_image
    fill_in "Main image", with: @movable.main_image
    fill_in "Max rent time", with: @movable.max_rent_time
    fill_in "Min rent time", with: @movable.min_rent_time
    fill_in "Name", with: @movable.name
    fill_in "Price", with: @movable.price
    fill_in "Stock", with: @movable.stock
    fill_in "User", with: @movable.user_id
    click_on "Update Movable"

    assert_text "Movable was successfully updated"
    click_on "Back"
  end

  test "should destroy Movable" do
    visit movable_url(@movable)
    click_on "Destroy this movable", match: :first

    assert_text "Movable was successfully destroyed"
  end
end
