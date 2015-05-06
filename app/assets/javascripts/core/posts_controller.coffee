#= require './view_controller'

class Spaces.PostsController extends Spaces.ViewController

	initialize: ->
		($ 'body').on 'updatePosts', =>
			@updateRelevantPosts()
		($ 'body').on 'postFollowed', (event, data) =>
			@updateFollowIcons data
		($ 'body').on 'postAdded', (event, data) =>
			@postAdded data

	# Update UI and trigger postAdded event
	postAdded: (data) =>
		($ '.modal').modal 'hide'
		($ '.all_posts .posts').prepend data

	updateRelevantPosts: =>
		$.ajax
			url: 'posts/relevant'
			type: 'GET'
			success: (data) ->
				$(".relevant_posts .posts").html data
			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error updating posts: "+errorThrown

	# Update the follow UI depending on whether the post was (un)followed
	updateFollowIcons: (data) =>
		follow_icons = ".ticket_box[project="+data['project']+"] img"
		console.log follow_icons
		if data['result'] == 'following'
			($ follow_icons).addClass("active")
		else 
			$(".follow_container").removeClass("following")
			($ follow_icons).removeClass("active")

		$('body').trigger('updatePosts');
