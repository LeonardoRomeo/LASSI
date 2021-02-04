require "application_system_test_case"

class ThirdpartsTest < ApplicationSystemTestCase
  setup do
    @thirdpart = thirdparts(:one)
  end

  test "visiting the index" do
    visit thirdparts_url
    assert_selector "h1", text: "Thirdparts"
  end

  test "creating a Thirdpart" do
    visit thirdparts_url
    click_on "New Thirdpart"

    fill_in "Email", with: @thirdpart.email
    fill_in "Name", with: @thirdpart.name
    click_on "Create Thirdpart"

    assert_text "Thirdpart was successfully created"
    click_on "Back"
  end

  test "updating a Thirdpart" do
    visit thirdparts_url
    click_on "Edit", match: :first

    fill_in "Email", with: @thirdpart.email
    fill_in "Name", with: @thirdpart.name
    click_on "Update Thirdpart"

    assert_text "Thirdpart was successfully updated"
    click_on "Back"
  end

  test "destroying a Thirdpart" do
    visit thirdparts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Thirdpart was successfully destroyed"
  end
end
