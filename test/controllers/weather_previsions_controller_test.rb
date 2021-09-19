require "test_helper"

class WeatherPrevisionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get weather_previsions_new_url
    assert_response :success
  end

  test "should get create" do
    get weather_previsions_create_url
    assert_response :success
  end

  test "should get edit" do
    get weather_previsions_edit_url
    assert_response :success
  end

  test "should get update" do
    get weather_previsions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get weather_previsions_destroy_url
    assert_response :success
  end
end
