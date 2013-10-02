module FeedsHelper
	def truncate(title)
		title = title[0..35]+'...' if title.length > 35
		title
	end
end
