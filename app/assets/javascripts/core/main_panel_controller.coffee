#= require './view_controller'

class Spaces.MainPanelController extends Spaces.ViewController

	initialize: ->
		($ 'body').on 'postFollowed', (event, data) =>
			@updateFollowDisplay data
		# remove any existing binding to avoid double-binding
		($ 'body').off 'postClicked', @updatePostShown
		($ 'body').on 'postClicked', @updatePostShown

	# Update the follow UI depending on whether the post was (un)followed
	updateFollowDisplay: (data) =>
		($ ".follow_container div").html data['result']
		($ ".follow_text").html data['num_follows']

		if data['result'] == 'following'
			$(".follow_container").addClass("following")
		else 
			$(".follow_container").removeClass("following")

	# make an ajax request to update the main post panel.
	updatePostShown: (event, postid) =>
		url = "/posts/#{postid}/preview"
		console.log "GET #{url}"
		$.ajax
			url: url
			type: "GET"
			success: (data)->
				console.log "     SUCCESS"
			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error previewing posts: "+errorThrown