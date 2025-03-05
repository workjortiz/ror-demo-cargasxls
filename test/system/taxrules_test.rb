require "application_system_test_case"

class TaxrulesTest < ApplicationSystemTestCase
  setup do
    @taxrule = taxrules(:one)
  end

  test "visiting the index" do
    visit taxrules_url
    assert_selector "h1", text: "Taxrules"
  end

  test "should create taxrule" do
    visit taxrules_url
    click_on "New taxrule"

    fill_in "Code", with: @taxrule.code
    fill_in "Name", with: @taxrule.name
    fill_in "Value rule", with: @taxrule.value_rule
    click_on "Create Taxrule"

    assert_text "Taxrule was successfully created"
    click_on "Back"
  end

  test "should update Taxrule" do
    visit taxrule_url(@taxrule)
    click_on "Edit this taxrule", match: :first

    fill_in "Code", with: @taxrule.code
    fill_in "Name", with: @taxrule.name
    fill_in "Value rule", with: @taxrule.value_rule
    click_on "Update Taxrule"

    assert_text "Taxrule was successfully updated"
    click_on "Back"
  end

  test "should destroy Taxrule" do
    visit taxrule_url(@taxrule)
    click_on "Destroy this taxrule", match: :first

    assert_text "Taxrule was successfully destroyed"
  end
end
