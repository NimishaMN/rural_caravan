require 'test_helper'

class ActivityDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_detail = activity_details(:one)
  end

  test "should get index" do
    get activity_details_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_detail_url
    assert_response :success
  end

  test "should create activity_detail" do
    assert_difference('ActivityDetail.count') do
      post activity_details_url, params: { activity_detail: {  } }
    end

    assert_redirected_to activity_detail_url(ActivityDetail.last)
  end

  test "should show activity_detail" do
    get activity_detail_url(@activity_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_detail_url(@activity_detail)
    assert_response :success
  end

  test "should update activity_detail" do
    patch activity_detail_url(@activity_detail), params: { activity_detail: {  } }
    assert_redirected_to activity_detail_url(@activity_detail)
  end

  test "should destroy activity_detail" do
    assert_difference('ActivityDetail.count', -1) do
      delete activity_detail_url(@activity_detail)
    end

    assert_redirected_to activity_details_url
  end
end
