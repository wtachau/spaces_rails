#= require './view_controller'

class Spaces.CommentsController extends Spaces.ViewController

	initialize: ([ @names ]) ->
		($ 'body').on 'commentAdded', (event, data) => 
			@addCommentToPost data
		@addTagListener()

	addCommentToPost: (data) =>
		($ '.previous_comments').append data
		($ '.comments form textarea').val ""
		($ '.comments form .textoverlay').html ""

	addTagListener: =>
		$.ajax
			url: 'users/allnames'
			type: 'GET'
			success: (data) ->
				$('#new_comment textarea').textcomplete([ {
					mentions: data
					match: /\B@(\w*)$/
					search: (term, callback) ->
						callback $.map(@mentions, (mention) ->
							if mention.toLowerCase().indexOf(term.toLowerCase()) >= 0 then mention else null
						)
					index: 1
					replace: (mention) ->
						'@' + mention + ' '

				} ], appendTo: 'body').overlay [ {
				  match: /\B@\w+/g
				  css: 'background-color': '#d8dfea'
				} ]
			error: ->
				console.log "Error getting all names"



		
