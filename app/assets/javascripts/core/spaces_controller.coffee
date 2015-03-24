#= require './view_controller'

class Spaces.SpacesController extends Spaces.ViewController

	initialize: ([shouldSelectize]) ->
		if shouldSelectize
			@selectizeElement()

	# "Selectize" an element by applying the Selectize js library
	# http://brianreavis.github.io/selectize.js/
	selectizeElement: ->
		selectize_control = @$container.selectize 
							 	maxItems: 5
							 	delimiter: ','
							 	persist: false
							 	create: (input)  ->
						 			value: input
						 			text: input