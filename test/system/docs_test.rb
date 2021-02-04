require "application_system_test_case"

class DocsTest < ApplicationSystemTestCase
  setup do
    @doc = docs(:one)
  end

  test "visiting the index" do
    visit docs_url
    assert_selector "h1", text: "Docs"
  end

  test "creating a Doc" do
    visit docs_url
    click_on "New Doc"

    fill_in "Argument", with: @doc.argument
    fill_in "File", with: @doc.file
    fill_in "Name", with: @doc.name
    fill_in "Thirdpart", with: @doc.thirdpart_id
    click_on "Create Doc"

    assert_text "Doc was successfully created"
    click_on "Back"
  end

  test "updating a Doc" do
    visit docs_url
    click_on "Edit", match: :first

    fill_in "Argument", with: @doc.argument
    fill_in "File", with: @doc.file
    fill_in "Name", with: @doc.name
    fill_in "Thirdpart", with: @doc.thirdpart_id
    click_on "Update Doc"

    assert_text "Doc was successfully updated"
    click_on "Back"
  end

  test "destroying a Doc" do
    visit docs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Doc was successfully destroyed"
  end
end
