class EventsController < ApplicationController
	before_action :set_event, only: [:show, :update, :destroy]
	skip_before_action :verify_authenticity_token

	def index
		@events = Event.all
		render json:@events
	end

	def show
		render json:@event
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			render json: { 'response' => 'Event saved.' , 'event' => @event }
		else
			render json: { 'response' => 'Creation failed.' }
		end
	end

	def update
    if @event.update(event_params)
    	render json: { 'response' => 'Event updated.', 'event' => @event }
    else
      render json: { 'response' => 'Update failed.' }
    end
  end

	def destroy
    @event.destroy
    render json: { 'response' => 'Event deleted.' }
  end

	private
		def event_params
	  	params.require(:event).permit(:name, :description)
		end

    def set_event
      @event = Event.find(params[:id])
    end

end
