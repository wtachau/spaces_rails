class ProjectDecorator < Draper::Decorator
	delegate_all

	def descriptive_follow_text
		if object.follows.count == 0
			""
		else
			count = object.follows.count
			"  |  #{count} #{pluralize(count, 'follow')}"
		end
	end

	def tag_list_decorated
		object.tag_list.map{ |tag| "<span class='tag_link'>#{tag}</span>" }.join(", ").html_safe
	end

end
