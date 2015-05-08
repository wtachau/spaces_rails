#= require './view_controller'

class Spaces.SlideoutController extends Spaces.ViewController

	initialize: ->
		@addSlideoutListener()

	addSlideoutListener: =>
		($ ".slideout .trigger .hide_text").hide()
		($ ".slideout .trigger").click () ->
			($ ".body_panel").toggleClass "shrunk"
			($ ".slideout_body").toggleClass "offscreen"
			($ ".slideout .trigger .show_text").toggle()
			($ ".slideout .trigger .hide_text").toggle()