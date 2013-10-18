json.array!(@suppliers) do |supplier|
  json.extract! supplier, :name
  json.url supplier_url(supplier, format: :json)
end
