require "application_system_test_case"

class ParksTest < ApplicationSystemTestCase
  setup do
    @park = parks(:one)
  end

  test "visiting the index" do
    visit parks_url
    assert_selector "h1", text: "公園ミッケ！！"
  end

  test "should create park" do
    visit parks_url
    click_on "公園を登録する"
  
    fill_in "住所", with: @park.address
    fill_in "説明欄", with: @park.description
    fill_in "Name", with: @park.name

    attach_file('park_image', Rails.root.join('test/fixtures/files/sample.jpg'), make_visible: true)

    click_on "Create Park"

    assert_text "Park was successfully created"
    click_on "Back"
  end

  test "should update Park" do
    visit park_url(@park)
    click_on "この公園を編集", match: :first

    fill_in "住所", with: @park.address
    fill_in "説明欄", with: @park.description
    fill_in "Name", with: @park.name

    attach_file('park_image', Rails.root.join('test/fixtures/files/sample.jpg'), make_visible: true)

    click_on "Update Park"

    assert_text "Park was successfully updated"
    click_on "Back"
  end

  test "should destroy Park" do
    visit park_url(@park)
    accept_confirm "本当に削除しますか？" do
      click_on "削除", match: :first
    end
    assert_text "Park was successfully destroyed"
  end
end
