require 'set'

class FeedEntry < ActiveRecord::Base
  belongs_to :feed
  
  GRUMPIES = Set.new ["war", "terror", "disease", "murder", "victim", "fear", "bomber", "suicide", "kill", "bomb", "kills", "victim", "victims", "sad", "nuclear", "chemical", "death"]


  def self.update_from_feed(feed_url, feed_id)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    unless feed.is_a?(Fixnum)
	    add_entries(feed.entries[0..10], feed_url, feed_id)
    else
	
    end
  end

  private
  
  def self.add_entries(entries, feed_url, feed_id)
    entries.each do |entry|
    if entry.title.nil?
      next
    end
    classification = Set.new(entry.title.downcase.split(" ")).intersection(GRUMPIES).count > 0 ? 'G' : 'H'
        create(
          :name             => entry.title[0..254],
          :summary          => entry.summary,
          :url              => entry.url,
          :published_at     => entry.published,
          :guid             => entry.id,
          :base_url         => feed_url,
	        :classification 	=> classification,
          :feed_id          => feed_id
        )
    end
  end
end
