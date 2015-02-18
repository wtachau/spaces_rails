# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Get the relevant posts and insert them in the "relevant to you" section
Spaces.updateRelevantPosts = () ->
	$.ajax
		url: 'posts/relevant'
		type: 'GET'
		success: (data, textStatus, jqXHR) ->
			$(".relevant_posts .posts").html data
		error: (jqXHR, textStatus, errorThrown) ->
			console.log "Error updating posts: "+errorThrown

# After adding a post:
#	- Clear the form
#	- Add the post to 'most recent' section
#	- Update both forms to include any new tags
Spaces.addPostCallback = (data) ->
	($ '.modal').modal 'hide'
	($ '.all_posts .posts').prepend data
	($ "#post_short")[0].value = ""
	($ "#post_long")[0].value = ""
	($ "#post_tag_list")[0].selectize.clear()
	Spaces.updatePostForm()
	Spaces.updateUserForm()
	
# Update the 'add post' form (generally by adding any new tags)
Spaces.updatePostForm = () ->
	$.ajax
		url: 'posts/update_form'
		type: 'GET'
		success: (data, textStatus, jqXHR) ->
			($ '#addPostPopup .post_form').html data
		error: (jqXHR, textStatus, errorThrown) ->
			console.log "Error updating form: #{errorThrown}"