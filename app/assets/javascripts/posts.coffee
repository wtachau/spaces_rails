# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# showNewPostScreen = ()

selectize_control = $('#select-tag').selectize 
					 	maxItems: 5
					 	delimiter: ','
					 	persist: false
					 	create: (input)  ->
				 			value: input
				 			text: input
					 	

