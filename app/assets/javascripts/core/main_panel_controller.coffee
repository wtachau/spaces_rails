#= require './view_controller'

class Spaces.MainPanelController extends Spaces.ViewController

	initialize: ->
		($ 'body').on 'postFollowed', (event, data) =>
			@updateFollowDisplay data

		($ 'body').on 'postFollowed', (event, data) =>
			@updateFollowIcons data

		# Make an ajax call and update the content on the main panel 
		($ 'body').on 'postClicked', (event, postid) =>
			($ "#panel_content").load("/posts/#{postid}/preview")


	# Update the follow UI depending on whether the post was (un)followed
	updateFollowDisplay: (data) =>
		($ ".follow_container div").html data['result']
		($ ".follow_text").html data['num_follows']

		if data['result'] == 'following'
			$(".follow_container").addClass("following")
		else 
			$(".follow_container").removeClass("following")

	# Update the follow UI depending on whether the post was (un)followed
	updateFollowIcons: (data) =>
		follow_icons = ".project_preview_container[project="+data['project']+"] img.follow"
		if data['result'] == 'following'
			($ follow_icons).addClass("active")
		else 
			$(".follow_container").removeClass("following")
			($ follow_icons).removeClass("active")