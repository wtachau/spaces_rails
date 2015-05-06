#= require './view_controller'

class Spaces.ProjectsController extends Spaces.ViewController

	initialize: ->
		($ 'body').on 'projectAdded', (event, data) =>
			@projectAdded data

	# Update UI
	projectAdded: (data) =>
		console.log data
		($ '.modal').modal 'hide'
		($ '.projects_preview_body').prepend data