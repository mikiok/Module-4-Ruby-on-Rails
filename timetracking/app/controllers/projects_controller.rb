class ProjectsController < ApplicationController
	def index
		@projects = Project.order(created_at: :asc).limit(10)
	end
end
