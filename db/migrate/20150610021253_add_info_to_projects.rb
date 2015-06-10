class AddInfoToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :github, :string
    add_column :projects, :dropbox, :string
  end
end
