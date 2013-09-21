json.array!(@gyms) do |gym|
  json.extract! gym, :name
  json.url gym_url(gym, format: :json)
end
