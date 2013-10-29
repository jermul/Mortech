class StaticPagesController < ApplicationController

	def home
		if signed_in?
      @itinerary  = current_user.itineraries.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
	end

	def about
	end

	def contact
	end
end 