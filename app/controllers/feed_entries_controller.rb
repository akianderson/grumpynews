class FeedEntriesController < ApplicationController
	def index
		feed = Feed.find(params[:feed_id])
		@feed_entries = FeedEntry.where(:base_url => feed.feed_url).limit(8)
	end
end
