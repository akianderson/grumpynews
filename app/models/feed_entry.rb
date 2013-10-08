require 'set'

class FeedEntry < ActiveRecord::Base

  GRUMPIES = Set.new ["war", "terror", "disease", "murder", "victim", "fear", "bomber", "suicide", "kill", "bomb", "kills", "victim", "victims", "sad", "nuclear", "chemical", "death"]


  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
  end

  private
  
  def self.add_entries(entries)
    entries.each do |entry|
    classification = Set.new(entry.title.downcase.split(" ")).intersection(GRUMPIES).count > 0 ? 'G' : 'H'
      unless exists? :guid => entry.id
        create!(
          :name         	=> entry.title,
          :summary      	=> entry.summary,
          :url          	=> entry.url,
          :published_at 	=> entry.published,
          :guid         	=> entry.id,
	  :classification 	=> classification
        )
      end
    end
  end
end
