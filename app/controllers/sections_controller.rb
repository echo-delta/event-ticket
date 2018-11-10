class SectionsController < ApplicationController
prepend_before_action :set_venue
before_action :set_section, only: [:show, :update, :destroy]
	skip_before_action :verify_authenticity_token

	def index
		@sections = @venue.sections
		render json:@sections
	end

	def show
		render json:@section
	end

	def create
		@section = @venue.sections.new(section_params)
		if @section.save
			render json: { 'response' => 'Section saved.' , 'section' => @section }
		else
			render json: { 'response' => 'Creation failed.' }
		end
	end

	def update
    if @section.update(section_params)
    	render json: { 'response' => 'Section updated.', 'section' => @section }
    else
      render json: { 'response' => 'Update failed.' }
    end
  end

	def destroy
    @section.destroy
    render json: { 'response' => 'Section deleted.' }
  end

	private
		def section_params
	  	params.require(:section).permit(:name, :capacity, :price)
		end

		def set_venue
			@venue = Venue.find(params[:venue_id])
		end

    def set_section
      @section = @venue.sections.find(params[:id])
    end
end
