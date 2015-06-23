json.array!(@cheeses) do |cheese|
  json.extract! cheese, :id
  json.url cheese_url(cheese, format: :json)
end
