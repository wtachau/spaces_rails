#= require './view_controller'

# Used to control ajax callbacks for remote form submissions
class Spaces.AjaxFormController extends Spaces.ViewController

	initialize: ([ @noSubmitButton, @callback ]) ->
		@$form = @$container.find 'form'
		@$submitButton = @$form.find 'input[type="submit"]'
		@$form
			.on('submit', @disableSubmitButton)
			.on('ajax:success', @formSucceeded)
			.on('ajax:error', @enableSubmitButton)

	disableSubmitButton: =>
		@$submitButton.prop 'disabled', true

	enableSubmitButton: =>
		@$submitButton.prop 'disabled', false

	formSucceeded: (e, data) =>
		@enableSubmitButton() 
		if @callback 
 			@callback data
 			