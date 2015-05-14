#= require './view_controller'

class Spaces.ProjectButtonController extends Spaces.ViewController

	initialize: ->
		(@$container.find 'button').on 'click', (event) =>
			# Hide all sections
			($ '.project_body_section').addClass "hidden"
			# Then show selected one
			($ '.project_body_section.' + (($ event.target).attr "section-target")).toggleClass "hidden"