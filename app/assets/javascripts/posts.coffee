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
