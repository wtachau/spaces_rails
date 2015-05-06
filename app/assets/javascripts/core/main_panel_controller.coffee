#= require './view_controller'

class Spaces.MainPanelController extends Spaces.ViewController

	initialize: ->
		($ 'body').on 'postFollowed', (event, data) =>
			@updateFollowDisplay data

	# Update the follow UI depending on whether the post was (un)followed
	updateFollowDisplay: (data) =>
		($ ".follow_container div").html data['result']
		($ ".follow_text").html data['num_follows']

		if data['result'] == 'following'
			$(".follow_container").addClass("following")
		else 
			$(".follow_container").removeClass("following")