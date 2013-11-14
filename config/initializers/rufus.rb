require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every("15m") do
	begin
		FeedEntry.delete_all
		Feed.all.each do |feed|
	  	FeedEntry.update_from_feed(feed.feed_url)
	  	feed.last_retrieved = Time.now
	  	feed.save
	  	Rails.logger.info "i just saved a feed for #{feed}!!!"
	        end
	rescue
		puts "oops db connection died"
	ensure
		ActiveRecord::Base.connection.release_connection if ActiveRecord::Base.connection
      		ActiveRecord::Base.clear_active_connections!
	end
end
