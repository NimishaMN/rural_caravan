require "application_system_test_case"

class ActivityDetailsTest < ApplicationSystemTestCase
  setup do
    @activity_detail = activity_details(:one)
  end

  test "visiting the index" do
    visit activity_details_url
    assert_selector "h1", text: "Activity Details"
  end

  test "creating a Activity detail" do
    visit activity_details_url
    click_on "New Activity Detail"

    click_on "Create Activity detail"

    assert_text "Activity detail was successfully created"
    click_on "Back"
  end

  test "updating a Activity detail" do
    visit activity_details_url
    click_on "Edit", match: :first

    click_on "Update Activity detail"

    assert_text "Activity detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity detail" do
    visit activity_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity detail was successfully destroyed"
  end
end
