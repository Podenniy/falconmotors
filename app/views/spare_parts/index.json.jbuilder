json.array!(@spare_parts) do |spare_part|
  json.extract! spare_part, :title, :descriptions, :image_url, :price
  json.url spare_part_url(spare_part, format: :json)
end
