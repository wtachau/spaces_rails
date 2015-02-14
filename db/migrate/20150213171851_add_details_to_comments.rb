class AddDetailsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :text, :string
    add_column :comments, :post_id, :integer
  end
end
