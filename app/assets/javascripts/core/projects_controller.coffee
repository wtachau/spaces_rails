#= require './view_controller'

class Spaces.ProjectsController extends Spaces.ViewController

	initialize: ->
		($ 'body').on 'projectAdded', (event, data) =>
			@projectAdded data

	# Update UI
	projectAdded: (data) =>
		# todo