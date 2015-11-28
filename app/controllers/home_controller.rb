class HomeController < ApplicationController
	def home
		@links = Link.all.order(:cached_votes_up => :desc)
	end

	def about_us
		
	end

	def contact_us
		
	end
end
