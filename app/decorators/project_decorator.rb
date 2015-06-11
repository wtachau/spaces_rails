class ProjectDecorator < Draper::Decorator
	delegate_all

	def tag_list_decorated
		object.tag_list.map{ |tag| "<span class='tag_link'>#{tag}</span>" }.join(", ").html_safe
	end

end
