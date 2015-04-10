class CommentDecorator < Draper::Decorator
	include ActionView::Helpers::TextHelper
	delegate_all

	def parsed_text
		# First detect and replace links with anchor 
		text_with_link = auto_link(object.text, :html => { :target => '_blank' })
		# Now grab tagged names with some regex magic
		r = /(@\w+)/
		(text_with_link.to_str.gsub(r) { |m| m.gsub($1, userID($1)) }).html_safe
	end

	private 
		def userID(tag)
			user = tag.gsub(/[@"]/,'')
			user = User.all.detect { |u| u.first_name + u.last_name == user }
			if user
				"<span class='username_link user_tag' user_id=#{user.id}> @#{user.first_name}#{user.last_name}</span> "
			end
		end
end