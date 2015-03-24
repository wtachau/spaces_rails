class Follow < ActiveRecord::Base
	belongs_to :user, dependent: :destroy, dependent: :destroy
	belongs_to :post, dependent: :destroy
end
