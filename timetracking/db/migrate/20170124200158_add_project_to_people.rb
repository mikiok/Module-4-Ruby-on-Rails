class AddProjectToPeople < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :person, index: true
  end
end
