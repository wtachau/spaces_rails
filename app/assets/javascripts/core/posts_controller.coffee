#= require './view_controller'

class Spaces.PostsController extends Spaces.ViewController

	initialize: ->
		($ 'body').on 'postFollowed', (event, data) =>
			@updateFollowIcons data

	# Update the follow UI depending on whether the post was (un)followed
	updateFollowIcons: (data) =>
		follow_icons = ".project_preview_container[project="+data['project']+"] img.follow"
		if data['result'] == 'following'
			($ follow_icons).addClass("active")
		else 
			$(".follow_container").removeClass("following")
			($ follow_icons).removeClass("active")
