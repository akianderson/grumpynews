task :update_feeds => :environment do
  begin
    FeedEntry.delete_all
    Feed.all.each do |feed|
      FeedEntry.update_from_feed(feed.feed_url, feed.id)
      feed.last_retrieved = Time.now
      feed.save
      puts "i just saved a feed for #{feed.title}!!!"
    end
  rescue => e
    puts "oops feed update failed #{e.message} #{e.backtrace}"
  #ensure
  #  ActiveRecord::Base.connection.release_connection if ActiveRecord::Base.connection
  #  ActiveRecord::Base.clear_active_connections!
  end
end
