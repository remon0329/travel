require "test_helper"

class ParksControllerTest < ActionDispatch::IntegrationTest
  include ActionDispatch::TestProcess::FixtureFile
  setup do
    @park = parks(:one)
  end

  test "should get index" do
    get parks_url
    assert_response :success
  end

  test "should get new" do
    get new_park_url
    assert_response :success
  end

  test "should create park" do
    image = fixture_file_upload(Rails.root.join("test/fixtures/files/sample.jpg"), "image/jpeg")

    assert_difference("Park.count") do
      post parks_url, params: {
        park: {
          name: "テスト公園",
          description: "テスト説明",
          address: "テスト住所",
          image: image
        }
      }
    end

    assert_redirected_to park_url(Park.last)
  end

  test "should show park" do
    get park_url(@park)
    assert_response :success
  end

  test "should get edit" do
    get edit_park_url(@park)
    assert_response :success
  end

  test "should update park" do
    image = fixture_file_upload(Rails.root.join("test/fixtures/files/sample.jpg"), "image/jpeg")

    patch park_url(@park), params: {
      park: {
        name: "更新後の公園名",
        description: "更新後の説明",
        address: "更新後の住所",
        image: image
      }
    }

    assert_redirected_to park_url(@park)
    @park.reload
    assert_equal "更新後の公園名", @park.name
  end

  test "should destroy park" do
    assert_difference("Park.count", -1) do
      delete park_url(@park)
    end

    assert_redirected_to parks_url
  end
end
