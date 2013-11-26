json.array!(@vin_cods) do |vin_cod|
  json.extract! vin_cod, :brend_avto, :model, :year, :volume, :code, :parts_list
  json.url vin_cod_url(vin_cod, format: :json)
end
