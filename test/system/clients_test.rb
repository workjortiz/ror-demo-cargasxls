require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "should create client" do
    visit clients_url
    click_on "New client"

    fill_in "Base64 code", with: @client.base64_code
    fill_in "Comercial address", with: @client.comercial_address
    fill_in "Comercial name", with: @client.comercial_name
    fill_in "Country", with: @client.country_id
    fill_in "Currency", with: @client.currency_id
    fill_in "Fiscal address", with: @client.fiscal_address
    fill_in "Fiscal name", with: @client.fiscal_name
    fill_in "Taxrule", with: @client.taxrule_id
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit client_url(@client)
    click_on "Edit this client", match: :first

    fill_in "Base64 code", with: @client.base64_code
    fill_in "Comercial address", with: @client.comercial_address
    fill_in "Comercial name", with: @client.comercial_name
    fill_in "Country", with: @client.country_id
    fill_in "Currency", with: @client.currency_id
    fill_in "Fiscal address", with: @client.fiscal_address
    fill_in "Fiscal name", with: @client.fiscal_name
    fill_in "Taxrule", with: @client.taxrule_id
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "should destroy Client" do
    visit client_url(@client)
    click_on "Destroy this client", match: :first

    assert_text "Client was successfully destroyed"
  end
end
