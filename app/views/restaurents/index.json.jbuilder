json.array!(@restaurents) do |restaurent|
  json.extract! restaurent, :id, :name, :address, :phone, :website
  json.url restaurent_url(restaurent, format: :json)
end
