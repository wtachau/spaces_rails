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

	def tag_list_decorated
		object.tag_list.map{ |tag| "<span class='tag'>#{tag}</span>" }.join(", ").html_safe
	end

end
