require "test_helper"

class TaxrulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taxrule = taxrules(:one)
  end

  test "should get index" do
    get taxrules_url
    assert_response :success
  end

  test "should get new" do
    get new_taxrule_url
    assert_response :success
  end

  test "should create taxrule" do
    assert_difference("Taxrule.count") do
      post taxrules_url, params: { taxrule: { code: @taxrule.code, name: @taxrule.name, value_rule: @taxrule.value_rule } }
    end

    assert_redirected_to taxrule_url(Taxrule.last)
  end

  test "should show taxrule" do
    get taxrule_url(@taxrule)
    assert_response :success
  end

  test "should get edit" do
    get edit_taxrule_url(@taxrule)
    assert_response :success
  end

  test "should update taxrule" do
    patch taxrule_url(@taxrule), params: { taxrule: { code: @taxrule.code, name: @taxrule.name, value_rule: @taxrule.value_rule } }
    assert_redirected_to taxrule_url(@taxrule)
  end

  test "should destroy taxrule" do
    assert_difference("Taxrule.count", -1) do
      delete taxrule_url(@taxrule)
    end

    assert_redirected_to taxrules_url
  end
end
