include ActionView::Helpers::DateHelper
class ProjectDecorator < Draper::Decorator
	delegate_all

	def time_ago
		time_ago_in_words object.updated_at
	end

end
