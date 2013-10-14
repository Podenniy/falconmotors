json.array!(@orders) do |order|
  json.extract! order, :name, :address, :email, :pay_type, :delivery_method
  json.url order_url(order, format: :json)
end
