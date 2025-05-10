require "application_system_test_case"

class ParksTest < ApplicationSystemTestCase
  setup do
    @park = parks(:one)
  end

  test "visiting the index" do
    visit parks_url
    assert_selector "h1", text: "Parks"
  end

  test "should create park" do
    visit parks_url
    click_on "New park"

    fill_in "Address", with: @park.address
    fill_in "Description", with: @park.description
    fill_in "Image", with: @park.image
    fill_in "Name", with: @park.name
    click_on "Create Park"

    assert_text "Park was successfully created"
    click_on "Back"
  end

  test "should update Park" do
    visit park_url(@park)
    click_on "Edit this park", match: :first

    fill_in "Address", with: @park.address
    fill_in "Description", with: @park.description
    fill_in "Image", with: @park.image
    fill_in "Name", with: @park.name
    click_on "Update Park"

    assert_text "Park was successfully updated"
    click_on "Back"
  end

  test "should destroy Park" do
    visit park_url(@park)
    click_on "Destroy this park", match: :first

    assert_text "Park was successfully destroyed"
  end
end
