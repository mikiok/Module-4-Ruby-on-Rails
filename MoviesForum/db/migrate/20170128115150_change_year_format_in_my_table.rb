class ChangeYearFormatInMyTable < ActiveRecord::Migration[5.0]

	def up
		change_column :movies, :year, :integer
	end

	def down
		change_column :movies, :year, :datetime
	end
end
