json.array!(@climbs) do |climb|
  json.extract! climb, :user_id, :route_id, :attempted_on, :success, :grade, :comment
  json.url climb_url(climb, format: :json)
end
