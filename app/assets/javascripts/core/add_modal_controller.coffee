#= require './view_controller'

class Spaces.AddModalController extends Spaces.ViewController

	initialize: ->
		@addSelectionListener()
		# Update post popup 
		($ 'body').on 'postAdded projectAdded', () =>
			($ '.modal').modal 'hide'
			@updatePopupForm()
		@customUIListeners()

	# Show the [updated] selected form
	updatePopupForm: =>
		formElement = ($ '#addPopup .form_selection')
		loadingElement = (@$container.find '.loading_icon')
		# hide form and show gif while waiting for response
		formElement.hide()
		loadingElement.toggleClass "hidden"
		# post or project?
		popupSelection = (@$container.find '.add_picker option:selected').val()
		$.ajax
			url: "#{popupSelection}/new"
			type: 'GET'
			success: (data, textStatus, jqXHR) =>
				loadingElement.toggleClass "hidden"
				formElement.show()
				formElement.html data
			error: (jqXHR, textStatus, errorThrown) =>
				console.log "Error updating form: #{errorThrown}"

	addSelectionListener: =>
		(@$container.find 'select.add_picker').change ()=>
			@updatePopupForm()

	customUIListeners: =>
		# If the form has a counter, update it
		($ document).on 'keyup', '#project_short', (e) ->
			($ '.counter').html ($ @).val().length 