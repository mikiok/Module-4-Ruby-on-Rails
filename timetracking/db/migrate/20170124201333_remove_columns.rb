class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :people, :participation_id
  	remove_column :projects, :person_id
  end
end
