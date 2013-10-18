json.array!(@price_parts) do |price_part|
  json.extract! price_part, :price, :delivery, :quantity
  json.url price_part_url(price_part, format: :json)
end
