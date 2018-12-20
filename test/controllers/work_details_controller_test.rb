require 'test_helper'

class WorkDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_detail = work_details(:one)
  end

  test "should get index" do
    get work_details_url
    assert_response :success
  end

  test "should get new" do
    get new_work_detail_url
    assert_response :success
  end

  test "should create work_detail" do
    assert_difference('WorkDetail.count') do
      post work_details_url, params: { work_detail: {  } }
    end

    assert_redirected_to work_detail_url(WorkDetail.last)
  end

  test "should show work_detail" do
    get work_detail_url(@work_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_detail_url(@work_detail)
    assert_response :success
  end

  test "should update work_detail" do
    patch work_detail_url(@work_detail), params: { work_detail: {  } }
    assert_redirected_to work_detail_url(@work_detail)
  end

  test "should destroy work_detail" do
    assert_difference('WorkDetail.count', -1) do
      delete work_detail_url(@work_detail)
    end

    assert_redirected_to work_details_url
  end
end
