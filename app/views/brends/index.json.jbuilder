json.array!(@brends) do |brend|
  json.extract! brend, :title, :description
  json.url brend_url(brend, format: :json)
end
