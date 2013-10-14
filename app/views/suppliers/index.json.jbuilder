json.array!(@suppliers) do |supplier|
  json.extract! supplier, :price, :quantity, :delivery
  json.url supplier_url(supplier, format: :json)
end
