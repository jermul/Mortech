class ItinerariesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@itinerary = current_user.itineraries.build(itinerary_params)
    if @itinerary.save
      flash[:success] = "Itinerary created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @itinerary.destroy
    redirect_to root_url
  end

  private

    def itinerary_params
      params.require(:itinerary).permit(:content)
    end

    def correct_user
      @itinerary = current_user.itineraries.find_by(id: params[:id])
      redirect_to root_url if @itinerary.nil?
    end
end