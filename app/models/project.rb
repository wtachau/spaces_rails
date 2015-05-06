class Project < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	acts_as_taggable
	has_many :follows, dependent: :destroy
	has_many :posts, dependent: :destroy

	scope :has_tag, ->(tag) { tagged_with([tag], any: true).order('updated_at DESC') }
end
