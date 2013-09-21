json.array!(@tags) do |tag|
  json.extract! tag, :user_id, :name, :token
  json.url tag_url(tag, format: :json)
end
