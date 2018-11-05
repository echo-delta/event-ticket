class InvoicesController < ApplicationController
before_action :set_invoice, only: [:show, :update, :destroy]
	skip_before_action :verify_authenticity_token

	def index
		@invoices = Invoice.all
		render json:@invoices
	end

	def show
		render json:@invoice
	end

	def create
		@invoice = Invoice.new(invoice_create_params)
		if @invoice.save
			render json: { 'response' => 'Invoice saved.' , 'invoice' => @invoice }
		else
			render json: { 'response' => 'Creation failed.' }
		end
	end

	def update
    if @invoice.update(invoice_params)
    	render json: { 'response' => 'Invoice updated.', 'invoice' => @invoice }
    else
      render json: { 'response' => 'Update failed.' }
    end
  end

	def destroy
    @invoice.destroy
    render json: { 'response' => 'Invoice deleted.' }
  end

	private
		def invoice_create_params
	  	params.require(:invoice).permit(:user_id, :event_id, :ticket_count)
		end

		def invoice_params
	  	params.require(:invoice).permit(:is_paid)
		end

    def set_invoice
      @invoice = Invoice.find(params[:id])
    end
end
