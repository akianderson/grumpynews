json.array!(@feeds) do |feed|
  json.extract! feed, :feed_url, :last_retrieved
  json.url feed_url(feed, format: :json)
end
