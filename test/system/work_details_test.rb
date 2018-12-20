require "application_system_test_case"

class WorkDetailsTest < ApplicationSystemTestCase
  setup do
    @work_detail = work_details(:one)
  end

  test "visiting the index" do
    visit work_details_url
    assert_selector "h1", text: "Work Details"
  end

  test "creating a Work detail" do
    visit work_details_url
    click_on "New Work Detail"

    click_on "Create Work detail"

    assert_text "Work detail was successfully created"
    click_on "Back"
  end

  test "updating a Work detail" do
    visit work_details_url
    click_on "Edit", match: :first

    click_on "Update Work detail"

    assert_text "Work detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Work detail" do
    visit work_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work detail was successfully destroyed"
  end
end
