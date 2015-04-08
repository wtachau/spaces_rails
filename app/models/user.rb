class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :follows, dependent: :destroy
	acts_as_taggable

	def tagName
		"#{first_name}#{last_name}"
	end
end
