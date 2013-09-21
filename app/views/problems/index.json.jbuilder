json.array!(@problems) do |problem|
  json.extract! problem, :gym_id, :active, :name, :grade, :height
  json.url problem_url(problem, format: :json)
end
