require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  setup do
    @room = rooms(:one)
  end

  test "visiting the index" do
    visit rooms_url
    assert_selector "h1", text: "Rooms"
  end

  test "creating a Room" do
    visit rooms_url
    click_on "New Room"

    fill_in "Foto", with: @room.foto
    fill_in "H ape", with: @room.h_ape
    fill_in "H chiu", with: @room.h_chiu
    fill_in "Name", with: @room.name
    fill_in "Num posti liberi", with: @room.num_posti_liberi
    fill_in "Num posti tot", with: @room.num_posti_tot
    check "Prese" if @room.prese
    check "Riscaldamento" if @room.riscaldamento
    fill_in "Thirdpart", with: @room.thirdpart_id
    check "Wifi" if @room.wifi
    click_on "Create Room"

    assert_text "Room was successfully created"
    click_on "Back"
  end

  test "updating a Room" do
    visit rooms_url
    click_on "Edit", match: :first

    fill_in "Foto", with: @room.foto
    fill_in "H ape", with: @room.h_ape
    fill_in "H chiu", with: @room.h_chiu
    fill_in "Name", with: @room.name
    fill_in "Num posti liberi", with: @room.num_posti_liberi
    fill_in "Num posti tot", with: @room.num_posti_tot
    check "Prese" if @room.prese
    check "Riscaldamento" if @room.riscaldamento
    fill_in "Thirdpart", with: @room.thirdpart_id
    check "Wifi" if @room.wifi
    click_on "Update Room"

    assert_text "Room was successfully updated"
    click_on "Back"
  end

  test "destroying a Room" do
    visit rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Room was successfully destroyed"
  end
end
