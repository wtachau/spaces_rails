#= require './view_controller'

class Spaces.ProjectButtonController extends Spaces.ViewController

	initialize: ( [toggleSections] ) ->
		(@$container.find 'button').on 'click', (event) =>
			# Hide all sections
			($ toggleSections).addClass "hidden"
			# Then show selected one
			($ toggleSections + "." + (($ event.target).attr "section-target")).toggleClass "hidden"