class TimeEntry < ApplicationRecord
	belongs_to :project
	validates :date, presence: true
end
