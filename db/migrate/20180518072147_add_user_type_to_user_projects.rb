class AddUserTypeToUserProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :user_projects, :user_type, :string
  end
end
