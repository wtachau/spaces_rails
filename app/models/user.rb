class User < ActiveRecord::Base
	has_many :posts
	acts_as_taggable

	def to_s
		first_name + " " + last_name
	end
end
