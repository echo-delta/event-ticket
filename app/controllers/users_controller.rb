class UsersController < ApplicationController
	before_action :set_user, only: [:show, :update]
	skip_before_action :verify_authenticity_token

	def index
		@users = User.all
		render json:@users
	end

	def show
		render json:@user
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render json: { 'response' => 'User saved.' , 'user' => @user }
		else
			render json: { 'response' => 'Creation failed.' }
		end
	end

	def update
    if @user.update(user_params)
    	render json: { 'response' => 'User updated.', 'user' => @user }
    else
      render json: { 'response' => 'Update failed.' }
    end
  end

	private
		def user_params
	  	params.require(:user).permit(:name)
		end

    def set_user
      @user = User.find(params[:id])
    end
end
