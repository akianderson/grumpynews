json.array!(@feeds) do |feed|
  json.extract! feed, :feed_url, :title, :id, :feed_entries
  json.url feed_url(feed, format: :json)
end
