class AddProblemsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :problem, :string
  end
end
