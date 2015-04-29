#= require './view_controller'

# Used to control ajax callbacks for remote form submissions
class Spaces.AjaxFormController extends Spaces.ViewController

	initialize: ([ @noSubmitButton, @callback ]) ->
		@$form = @$container.find 'form'
		@$submitButton = @$form.find 'input[type="submit"]'
		@$form
			.on('submit', @disableSubmitButton)
			.on('ajax:error', @enableSubmitButton)
			.on('ajax:complete', @succeeded)

	succeeded: (e, jqXHR, textStatus) =>
		@enableSubmitButton() 
		if @callback 
 			@callback jqXHR.responseText

	disableSubmitButton: =>
		@$submitButton.prop 'disabled', true

	enableSubmitButton: =>
		@$submitButton.prop 'disabled', false

	formSucceeded: (e, data, textStatus, jqXHR) =>
		@enableSubmitButton() 
		if @callback 
 			@callback data
 			