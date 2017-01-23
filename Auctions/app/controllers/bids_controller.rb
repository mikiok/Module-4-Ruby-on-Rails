class BidsController < ApplicationController
	def new
		@bid = user.bids.new
	end

	def create
		@bid = user.products.bid.new(entry_params)

		if @bid.save
			flash[:notice] = "The user #{user.name} made a bid"
			redirect_to "/users/#{user.id}/products/#{product.id}"
		else
			flash[:alert] = @bid.errors.full_messages
			render 'products/show'
		end
	end

	private

	def entry_params
		params.require(:bid).permit(:amount)
	end

	def bid
		@bid = Bid.find_by(id: params[:id])
	end

	def user
		@user = User.find_by(id: params[:user_id])
	end

	def product
		@product = Product.find_by(id: params[:product_id])
	end
end