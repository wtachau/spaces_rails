class AddGoogleIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :googleID, :string
  end
end
