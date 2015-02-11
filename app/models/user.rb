class User < ActiveRecord::Base
	has_many :posts

	def to_s
		first_name + " " + last_name
	end
end
