class AddProjectToFollows < ActiveRecord::Migration
  def change
    add_column :follows, :project_id, :integer
  end
end
