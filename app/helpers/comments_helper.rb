module CommentsHelper

	# Parse text for @Usernames, calling given function on them
	def get_users_from(text, lam)
		r = /(@\w+)/
		text.gsub(r) { |m| lam.call(m) }
	end

	#Given @FirstLast, return user named First Last
	def userFromTag(tag)
		User.all.detect { |u| u.first_name + u.last_name == tag.gsub(/[@"]/,'') }
	end

end
