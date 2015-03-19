#= require './view_controller'

class Spaces.PostsController extends Spaces.ViewController

	initialize: ->
		($ 'body').on 'tagsUpdated', () ->
			updateRelevantPosts()
		($ 'body').on 'postAdded', (event, data) ->
			postAdded data
		($ 'body').on 'postFollowed', (event, data) ->
			updateFollowDisplay data

	updateRelevantPosts = () ->
		$.ajax
			url: 'posts/relevant'
			type: 'GET'
			success: (data) ->
				$(".relevant_posts .posts").html data
			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error updating posts: "+errorThrown

	# Update UI and trigger postAdded event
	postAdded = (data) ->
		($ '.modal').modal 'hide'
		($ '.all_posts .posts').prepend data
		updatePostForm()
	
	# Update the 'add post' form (generally by adding any new tags)
	updatePostForm = () ->
		$.ajax
			url: 'posts/edit'
			type: 'GET'
			success: (data, textStatus, jqXHR) ->
				($ '#addPostPopup .post_form').html data
			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error updating form: #{errorThrown}"

	# Update the follow UI depending on whether the post was (un)followed
	updateFollowDisplay = (data) ->
		($ ".follow_container div").html data['result']
		($ ".follow_text").html data['num_follows']

		follow_icons = ".ticket_box.ticket-#{data['post']} .ticket_icon.follow img"
		if data['result'] == 'following'
			$(".follow_container").addClass("following")
			($ follow_icons).addClass("active")
		else 
			$(".follow_container").removeClass("following")
			($ follow_icons).removeClass("active")