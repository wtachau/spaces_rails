# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# "Selectize" an element by applying the Selectize js library
# http://brianreavis.github.io/selectize.js/
Spaces.selectizeElement = (element) ->
	selectize_control = $(element).selectize 
						 	maxItems: 5
						 	delimiter: ','
						 	persist: false
						 	create: (input)  ->
					 			value: input
					 			text: input