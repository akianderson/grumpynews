class HomeController < ApplicationController
	def index
		#probably should be a hashmap with the site as a key
		params[:classification] ||= 'G'
		@feeds = FeedEntry.find_all_by_classification(params[:classification])
		respond_to do |format|
			format.html
		end
		
	end
end
