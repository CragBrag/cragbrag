json.array!(@routes) do |route|
  json.extract! route, :gym_id, :active, :name, :grade, :height
  json.url route_url(route, format: :json)
end
