json.extract! country, :id, :name, :iso_code, :region_code, :created_at, :updated_at
json.url country_url(country, format: :json)
