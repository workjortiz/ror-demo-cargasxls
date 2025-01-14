require "application_system_test_case"

class UnitMeasuresTest < ApplicationSystemTestCase
  setup do
    @unit_measure = unit_measures(:one)
  end

  test "visiting the index" do
    visit unit_measures_url
    assert_selector "h1", text: "Unit measures"
  end

  test "should create unit measure" do
    visit unit_measures_url
    click_on "New unit measure"

    fill_in "Iso code", with: @unit_measure.iso_code
    fill_in "Name", with: @unit_measure.name
    click_on "Create Unit measure"

    assert_text "Unit measure was successfully created"
    click_on "Back"
  end

  test "should update Unit measure" do
    visit unit_measure_url(@unit_measure)
    click_on "Edit this unit measure", match: :first

    fill_in "Iso code", with: @unit_measure.iso_code
    fill_in "Name", with: @unit_measure.name
    click_on "Update Unit measure"

    assert_text "Unit measure was successfully updated"
    click_on "Back"
  end

  test "should destroy Unit measure" do
    visit unit_measure_url(@unit_measure)
    click_on "Destroy this unit measure", match: :first

    assert_text "Unit measure was successfully destroyed"
  end
end
