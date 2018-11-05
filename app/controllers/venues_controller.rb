class VenuesController < ApplicationController
before_action :set_venue, only: [:show, :update, :destroy]
	skip_before_action :verify_authenticity_token

	def index
		@venues = Venue.all
		render json:@venues
	end

	def show
		render json:@venue
	end

	def create
		@venue = Venue.new(venue_params)
		if @venue.save
			render json: { 'response' => 'Venue saved.' , 'venue' => @venue }
		else
			render json: { 'response' => 'Creation failed.' }
		end
	end

	def update
    if @venue.update(venue_params)
    	render json: { 'response' => 'Venue updated.', 'venue' => @venue }
    else
      render json: { 'response' => 'Update failed.' }
    end
  end

	def destroy
    @venue.destroy
    render json: { 'response' => 'Venue deleted.' }
  end

	private
		def venue_params
	  	params.require(:venue).permit(:name, :address)
		end

    def set_venue
      @venue = Venue.find(params[:id])
    end
end
