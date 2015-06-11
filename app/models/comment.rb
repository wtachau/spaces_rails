class Comment < ActiveRecord::Base
	belongs_to :post, dependent: :destroy
	belongs_to :project, dependent: :destroy
	belongs_to :user, dependent: :destroy

	attachment :image
end
