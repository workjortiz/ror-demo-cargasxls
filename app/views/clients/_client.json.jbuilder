json.extract! client, :id, :fiscal_name, :comercial_name, :fiscal_address, :comercial_address, :base64_code, :country_id, :taxrule_id, :currency_id, :created_at, :updated_at
json.url client_url(client, format: :json)
