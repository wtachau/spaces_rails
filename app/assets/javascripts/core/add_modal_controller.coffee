#= require './view_controller'

class Spaces.AddModalController extends Spaces.ViewController

	initialize: ->
		@addSelectionListener()
		# Update post popup 
		($ 'body').on 'postAdded', () =>
			@updatePopupForm()

	# Show the [updated] selected form
	updatePopupForm: =>
		formElement = ($ '#addPopup .form_selection')
		loadingElement = (@$container.find '.loading_icon')
		# hide form and show gif while waiting for response
		formElement.hide()
		loadingElement.show()
		# post or project?
		popupSelection = (@$container.find '.selectpicker option:selected').val()
		$.ajax
			url: "#{popupSelection}/new"
			type: 'GET'
			success: (data, textStatus, jqXHR) =>
				loadingElement.hide()
				formElement.show()
				formElement.html data
			error: (jqXHR, textStatus, errorThrown) =>
				console.log "Error updating form: #{errorThrown}"

	addSelectionListener: =>
		(@$container.find 'select.selectpicker').change ()=>
			@updatePopupForm()