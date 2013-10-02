require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every("15m") do
	FeedEntry.delete_all
	Feed.all.each do |feed|
  	FeedEntry.update_from_feed(feed.feed_url)
  	feed.last_retrieved = Time.now
  	feed.save
  	Rails.logger.info "i just saved a feed for #{feed}!!!"
  end
end