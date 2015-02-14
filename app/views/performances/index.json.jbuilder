json.array!(@performances) do |performance|
  json.extract! performance, :id, :player, :week, :points
  json.url performance_url(performance, format: :json)
end
