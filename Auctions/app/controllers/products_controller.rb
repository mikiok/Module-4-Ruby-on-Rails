class ProductsController < ApplicationController
	def index
		@products = user.products.limit(10);
	end

	def show
		product
	end

	def new
		@product = user.products.new
	end

	def create
		@product = user.products.new(entry_params)

		if @product.save
			flash[:notice] = "The product #{@product.title} has been created"
			redirect_to "/users/#{user.id}/products"
		else
			flash[:alert] = @product.errors.full_messages
			render 'new'
		end
	end


	def destroy
		if product.destroy
			flash[:notice] = "The product #{@product.title} has been deleted"
			redirect_to '/users/#{user.id}/products'
		end
	end

	private

	def entry_params
		params.require(:product).permit(:title, :description, :deadline)
	end

	def product
		@product = Product.find_by(id: params[:id])
	end

	def user
		#binding.pry
		@user = User.find_by(id: params[:user_id])

	end
end
