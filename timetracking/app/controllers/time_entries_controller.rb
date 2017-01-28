class TimeEntriesController < ApplicationController
	def index
		@project = Project.find_by(id: params[:project_id])
		@time_entries = @project.time_entries.limit(10)
		@entries = @time_entries
	end

	def new
		@project = Project.find_by(id: params[:project_id])
		@time_entry = project.time_entries.new


	end

	def create
		@time_entry = project.time_entries.new(
						hours: params[:time_entry][:hours],
						minutes: params[:time_entry][:minutes],
						date: params[:time_entry][:date],
						comments: params[:time_entry][:comments])
		if @time_entry.save
			flash[:notice] = "time_entry created successfully" 
			redirect_to "/projects/#{project.id}/time_entries"
		else
			flash[:alert] = "Introduce the date"
			render 'new'
		end

	end

	def edit
		time_entry
	end

	def time_entry
		@time_entry = project.time_entries.find_by(id: params[:id])
	end

	def time_entry_params
		params.require(:time_entry).permit(:hours, :minutes, :date, :comments)
	end

	def update
		time_entry.update(
						time_entry_params
					)
		redirect_to "/projects/#{project.id}/time_entries/"
	end

	def destroy
		time_entry.destroy
		redirect_to "/projects/#{project.id}/time_entries"
		
	end

	private

	def project
		@project = Project.find_by(id: params[:project_id])
	end
end
