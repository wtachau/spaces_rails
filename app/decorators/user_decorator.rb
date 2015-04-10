class UserDecorator < Draper::Decorator
	delegate_all

	def full_name
		object.first_name + " " + object.last_name
	end

	def tag_list_decorated
		("<span class='tags'>" + object.tag_list.map{ |tag| "<span class='tag_link'>#{tag}</span>" }.join(", ") + "</span>").html_safe
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
