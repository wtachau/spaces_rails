class PostDecorator < Draper::Decorator
	delegate_all

	def descriptive_follow_text
		if object.follows.count == 0
			""
		elsif object.follows.count == 1
			" | 1 follow"
		else
			"  |  #{object.follows.count} follows"
		end
	end

	# Define presentation-specific methods here. Helpers are accessed through
	# `helpers` (aka `h`). You can override attributes, for example:
	#
	#   def created_at
	#     helpers.content_tag :span, class: 'time' do
	#       object.created_at.strftime("%a %m/%d/%y")
	#     end
	#   end

end
