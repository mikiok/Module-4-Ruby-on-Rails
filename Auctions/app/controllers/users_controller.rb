class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		user
	end

	def new
		@user= User.new
		render 'new'
	end

	def create
		@user = User.new(entry_params)
		if @user.save
			flash[:notice] = "The user #{@user.name} has been created"
			redirect_to '/users'
		else
			flash[:alert] = @user.errors.full_messages
			render 'new'
		end
	end

	def destroy
		user.destroy
		redirect_to "/users"
		
	end

	private

	def entry_params
		params.require(:user).permit(:name, :email_address)
	end

	def user
		@user = User.find_by(id: params[:id])
	end
end
