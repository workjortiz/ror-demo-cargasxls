json.extract! product, :id, :short_code, :long_code, :description, :base64_code, :brand_id, :unit_measure_id, :created_at, :updated_at
json.url product_url(product, format: :json)
