class TicketsController < ApplicationController
	before_action :set_ticket, only: [:show, :update, :destroy]
	skip_before_action :verify_authenticity_token

	def index
		@tickets = Ticket.all
		render json:@tickets
	end

	def show
		render json:@ticket
	end

	def create
		@ticket = Ticket.new(ticket_create_params)
		if @ticket.save
			render json: { 'response' => 'Ticket saved.' , 'ticket' => @ticket }
		else
			render json: { 'response' => 'Creation failed.' }
		end
	end

	def update
    if @ticket.update(ticket_params)
    	render json: { 'response' => 'Ticket updated.', 'ticket' => @ticket }
    else
      render json: { 'response' => 'Update failed.' }
    end
  end

	def destroy
    @ticket.destroy
    render json: { 'response' => 'Ticket deleted.' }
  end

	private
		def ticket_create_params
	  	params.require(:ticket).permit(:user_id, :event_id)
		end

		def ticket_params
	  	params.require(:ticket).permit(:user_id)
		end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
end
