module ApplicationHelper

	def random_dom_id
		rand(10**5)
	end

	def time_diff(updated_at)
		time_diff = Time.diff(Time.now, updated_at)
		if time_diff[:minute] < 1
			"#{time_diff[:second]} seconds ago"
		elsif time_diff[:minute] == 1
			"a minute ago"
		elsif time_diff[:hour] < 1
			"#{time_diff[:minute]} minutes ago"
		elsif time_diff[:hour] == 1
			"an hour ago"
		elsif time_diff[:day] < 1
			"#{time_diff[:hour]} hours ago"
		elsif time_diff[:day] == 1
			"yesterday"
		else 
			"#{time_diff[:day]} days ago"
		end
	end

end
