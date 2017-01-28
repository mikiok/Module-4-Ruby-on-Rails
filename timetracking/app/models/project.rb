class Project < ApplicationRecord
	has_many :time_entries
	has_many :participations
	has_many :projects, through :participations

	validates :name, :description, presence: true

	has_attached_file :logo, styles: {medium: "300x300",thumb: "100x100", small: "50x50>" , big: "500x500>"}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	def delete_projects
		projects = where('created_at < ?', last_week)
		projects.delete_all
	end

	private

	def last_week
		Date.today - 1.week
	end
end
