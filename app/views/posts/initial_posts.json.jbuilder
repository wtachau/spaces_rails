json.key_format! camelize: :lower
json.initial_relevant_posts relevant_posts do |post|
	json.partial! 'posts/post', post: post
end

json.initial_recent_posts recent_posts do |post|
	json.partial! 'posts/post', post: post
end 