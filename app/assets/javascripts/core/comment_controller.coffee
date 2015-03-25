#= require './view_controller'

class Spaces.CommentsController extends Spaces.ViewController

	initialize: ->
		($ 'body').on 'commentAdded', (event, data) => 
			@addCommentToPost data

	addCommentToPost: (data) =>
		($ '.previous_comments').append data
		($ '.comments form textarea').val ""