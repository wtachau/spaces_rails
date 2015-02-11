# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Spaces.updateRelevantPosts = () ->
	$.ajax
		url: 'posts/relevant'
		type: 'GET'
		success: (data, textStatus, jqXHR) ->
			$(".relevant_posts .posts").html data
		error: (jqXHR, textStatus, errorThrown) ->
			console.log "Error updating posts: "+errorThrown

Spaces.addPostCallback = (data) ->
	($ '.modal').modal 'hide'
	($ '.all_posts .posts').prepend data
  	# and clear forms
	($ "#post_short")[0].value = ""
	($ "#post_long")[0].value = ""
	($ "#post_tag_list")[0].selectize.clear()
	Spaces.updatePostForm()
	Spaces.updateUserForm()
	
	
Spaces.updatePostForm = () ->
	$.ajax
		url: 'posts/update_form'
		type: 'GET'
		success: (data, textStatus, jqXHR) ->
			($ '#addPostPopup .post_form').html data
		error: (jqXHR, textStatus, errorThrown) ->
			console.log "Error updating form: #{errorThrown}"