class PeopleController < ApplicationController
	def new
		@person = Person.new
		render 'new'
	end
	
	def create
		@person = Person.new(person_params)

		if @person.save
			redirect_to "/people/#{@person.id}"
		else
			flash[:error] = @person.errors.messages
			render 'new'
		end
	end


	def show
		@person = Person.find_by(id: params[:id])
		unless @person.present?
			render :file => 'public/404.html'
			
		end
	end

	private

	def person_params
		params.require(:person).permit(:name)
	end
end
