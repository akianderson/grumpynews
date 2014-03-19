# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Feed.create({
	feed_url: 'http://feeds.feedburner.com/TechCrunch/',
	title: 'TechCruch'
	})
Feed.create({
	feed_url: 'http://www.reddit.com/r/technology/.rss',
	title: 'Reddit Tech'
	})
Feed.create({
	feed_url: 'http://feeds.huffingtonpost.com/huffingtonpost/raw_feed',
	title: 'HuffPo'
	})
Feed.create({
	feed_url: 'http://feeds.wired.com/wired/index',
	title: 'Wired'
	})
Feed.create({
	feed_url: 'http://feeds.bbci.co.uk/news/rss.xml',
	title: 'BBC'
	})
Feed.create({
	feed_url: 'http://www.slate.com/rss/',
	title: 'Slate'
	})
Feed.create({
	feed_url: 'http://www.npr.org/rss/rss.php?id=1001',
	title: 'Npr'
	})
Feed.create({
	feed_url: 'http://feeds.arstechnica.com/arstechnica/index',
	title: 'ArsTechnica'
	})
Feed.create({
	feed_url: 'http://rss.cnn.com/rss/cnn_health.rss',
	title: 'CNN Health'
	})