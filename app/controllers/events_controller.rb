class EventsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@events = Event.all
		render json:@events
	end

	def show
		@event = Event.find(params[:id])
		render json:@event
	end

	def create
		puts(params)
		@event = Event.new(event_params)
		if @event.save
			render html: 'saved.'
		end
	end

	private
		def event_params
	  	params.require(:event).permit(:name, :description)
		end

end
