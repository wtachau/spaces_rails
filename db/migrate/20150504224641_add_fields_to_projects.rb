class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :short, :text
  end
end
