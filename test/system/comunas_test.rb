require "application_system_test_case"

class ComunasTest < ApplicationSystemTestCase
  setup do
    @comuna = comunas(:one)
  end

  test "visiting the index" do
    visit comunas_url
    assert_selector "h1", text: "Comunas"
  end

  test "should create comuna" do
    visit comunas_url
    click_on "New comuna"

    fill_in "Name", with: @comuna.name
    click_on "Create Comuna"

    assert_text "Comuna was successfully created"
    click_on "Back"
  end

  test "should update Comuna" do
    visit comuna_url(@comuna)
    click_on "Edit this comuna", match: :first

    fill_in "Name", with: @comuna.name
    click_on "Update Comuna"

    assert_text "Comuna was successfully updated"
    click_on "Back"
  end

  test "should destroy Comuna" do
    visit comuna_url(@comuna)
    click_on "Destroy this comuna", match: :first

    assert_text "Comuna was successfully destroyed"
  end
end
