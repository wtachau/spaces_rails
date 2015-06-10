class AddSolutionsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :solution, :string
  end
end
