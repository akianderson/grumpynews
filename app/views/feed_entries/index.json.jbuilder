json.array!(@feed_entries) do |feed_entry|
  json.extract! feed_entry, :name, :url, :summary
  json.url feed_url(feed_entry, format: :json)
end