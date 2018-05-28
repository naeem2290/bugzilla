class AddAssignedToUserProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :user_projects, :assigned, :integer
  end
end
