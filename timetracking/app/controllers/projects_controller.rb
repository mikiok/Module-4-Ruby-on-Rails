class ProjectsController < ApplicationController
	def index
		@projects = Project.order(created_at: :desc).limit(10)
	end
	def show
		@project = Project.find_by(id: params[:id])
		unless @project.present?
			render :file => 'public/404.html'
			
		end
	end

	def new
		@project = Project.new
		render 'new'
	end
	
	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to "/projects/#{@project.id}"
		else
			flash[:error] = @project.errors.messages
			render 'new'
		end
	end

	private

	def project_params
		params.require(:project).permit(:name, :description, :logo)
	end
end