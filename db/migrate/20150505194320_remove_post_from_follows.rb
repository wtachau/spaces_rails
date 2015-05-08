class RemovePostFromFollows < ActiveRecord::Migration
  def change
    remove_column :follows, :post_id, :string
  end
end
