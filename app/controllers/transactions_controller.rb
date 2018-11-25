class TransactionsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def book_event
		@parameters = params[:parameters]

		if Event.exists?(@parameters[:EventId])
			@event = Event.find(@parameters[:EventId])
			if User.exists?(@parameters[:UserId])
				@user = User.find(@parameters[:UserId])
				if @invoice = @user.invoices.create(:event_id => @event.id)
					total_price = 0
					@parameters[:SectionIdList].each do |sectionId|
						@invoice.booked_sections.create(:section_id => sectionId)
						@section = Section.find(sectionId)
						@section.update(:capacity => @section.capacity - 1)
						total_price += @section.price
					end
					# TODO: Call Payment Gateway(?) 
		    	render json: { 'parameters' => {'StatusMessage' => 'Book success. Please pay ASAP.'}, 'invoice' => @invoice, 'total_price': total_price }
				else
		      render json: { 'parameters' => {'StatusMessage' => 'Book failed.'} }
				end
		  else
		  	render json: { 'parameters' => {'StatusMessage' => "Invalid user."} }
		  end
		else
			render json: { 'parameters' => {'StatusMessage' => "Event doesn't exist."} }
		end
	end

	def update_sections 
		@parameters = params[:parameters]
		if @invoice = Invoice.find(@parameters[:InvoiceId])
					total_price = 0
					@parameters[:SectionIdList].each do |sectionId|
						@invoice.booked_sections.create(:section_id => sectionId)
						@section = Section.find(sectionId)
						@section.update(:capacity => @section.capacity + @parameters[:add_amount])
						total_price += @section.price
					end
					# TODO: Call Payment Gateway(?) 
		    	render json: { 'parameters' => {'StatusMessage' => 'Book success. Please pay ASAP.', 'invoice' => @invoice, 'total_price': total_price }}
				else
		      render json: { 'parameters' => {'StatusMessage' => 'Book failed.'} }
				end
	end

	def pay_invoice
		# TODO: Call Payment Gateway(?) 

		@parameters = params[:parameters]
		if Invoice.exists?(@parameters[:InvoiceId])
			@invoice = Invoice.find(@parameters[:InvoiceId])
			if @invoice.is_paid == 0
				@invoice.booked_sections.each do |booked_section|
					@invoice.tickets.create(
						:user_id => @invoice.user_id,
						:event_id => @invoice.event_id,
						:section_id => booked_section.section_id
					)
				end
				@invoice.update(:is_paid => 1)
				ticketIdList = Ticket.where(:invoice_id => @invoice.id)
				render json: { 'parameters' => {'TicketIdList' => ticketIdList.map(&:id)} }
			else
				render json: { 'parameters' => {'TicketIdList' => [-1]} }
			end
		else
			render json: { 'parameters' => {'TicketIdList' => [-1]} }
		end

	end

	def cancel_section
		@parameters = params[:parameters]

		if Invoice.exists?(@parameters[:InvoiceId])
			@invoice = Invoice.find(@parameters[:InvoiceId])
			if @invoice.is_paid == 1
				# TODO: Call Payment Gateway

				@invoice.tickets.each do |ticket|
					@section = Section.find(ticket.section_id)
					@section.update(:capacity => @section.capacity + 1)
				end
				render json: { 'parameters' => {'StatusMessage' => "Refund success."} }
			else
				render json: { 'parameters' => {'StatusMessage' => "Invoice is not paid yet."} }
			end
		else
			render json: { 'parameters' => {'StatusMessage' => "Invoice doesn't exist."} }
		end

	end

	def cancel_ticket
		@parameters = params[:parameters]

		if Invoice.exists?(@parameters[:InvoiceId])
			@invoice = Invoice.find(@parameters[:InvoiceId])
			if @invoice.is_paid == 1
				# TODO: Call Payment Gateway
				@sectionIdList = Array.new
				@invoice.tickets.each do |ticket|
					@sectionIdList.push(ticket.section_id)
					ticket.destroy
				@invoice.update(:is_paid => 2)
				end
				render json: { 'parameters' => {'StatusMessage' => "Ticket deleted.", "SectionIdList" => @sectionIdList}}
			else
				render json: { 'parameters' => {'StatusMessage' => "Invoice is not paid yet."} }
			end
		else
			render json: { 'parameters' => {'StatusMessage' => "Invoice doesn't exist."} }
		end

	end

	def gift_ticket
		@parameters = params[:parameters]

		if Ticket.exists?(@parameters[:TicketId])
			@ticket = Ticket.find(@parameters[:TicketId])
			if User.exists?(@parameters[:UserId]) and @ticket.user_id != @parameters[:UserId]
				if @ticket.update(:user_id => @parameters[:UserId])
		    	render json: { 'parameters' => {'StatusMessage' => 'Gift success.'}, 'ticket' => @ticket }
		    else
		      render json: { 'parameters' => {'StatusMessage' => 'Gift failed.'} }
		    end
		  else
		  	render json: { 'parameters' => {'StatusMessage' => "Invalid receiver."} }
		  end
		else
			render json: { 'parameters' => {'StatusMessage' => "Ticket doesn't exist."} }
		end
	end

end
