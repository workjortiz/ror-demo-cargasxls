require "test_helper"

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency = currencies(:one)
  end

  test "should get index" do
    get currencies_url
    assert_response :success
  end

  test "should get new" do
    get new_currency_url
    assert_response :success
  end

  test "should create currency" do
    assert_difference("Currency.count") do
      post currencies_url, params: { currency: { country_id: @currency.country_id, iso_code: @currency.iso_code, name: @currency.name, short_code: @currency.short_code } }
    end

    assert_redirected_to currency_url(Currency.last)
  end

  test "should show currency" do
    get currency_url(@currency)
    assert_response :success
  end

  test "should get edit" do
    get edit_currency_url(@currency)
    assert_response :success
  end

  test "should update currency" do
    patch currency_url(@currency), params: { currency: { country_id: @currency.country_id, iso_code: @currency.iso_code, name: @currency.name, short_code: @currency.short_code } }
    assert_redirected_to currency_url(@currency)
  end

  test "should destroy currency" do
    assert_difference("Currency.count", -1) do
      delete currency_url(@currency)
    end

    assert_redirected_to currencies_url
  end
end
