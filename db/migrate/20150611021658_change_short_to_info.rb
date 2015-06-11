class ChangeShortToInfo < ActiveRecord::Migration
  def change
  	rename_column :projects, :short, :info
  end
end
