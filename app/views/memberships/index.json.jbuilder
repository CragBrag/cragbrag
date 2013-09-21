json.array!(@memberships) do |membership|
  json.extract! membership, :user_id, :gym_id, :role
  json.url membership_url(membership, format: :json)
end
