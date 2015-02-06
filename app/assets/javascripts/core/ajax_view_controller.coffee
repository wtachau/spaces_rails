#= require './view_controller'
class Spaces.AjaxFormController extends Spaces.ViewController

  initialize: ([ @noSubmitButton, @hideModal ]) ->

    console.log @$container

    @$form = @$container.find 'form'
    console.log @$form
    @$submitButton = @$form.find 'input[type="submit"]'
    console.log @$submitButton
    @$form
      .on('submit', @disableSubmitButton)
      .on('ajax:success', @formSucceeded)
      .on('ajax:error', @enableSubmitButton)

  disableSubmitButton: =>
    @$submitButton.prop 'disabled', true

  enableSubmitButton:=>
    @$submitButton.prop 'disabled', false

  formSucceeded: (e, data, status, xhr) =>
    if @hideModal
      ($ '.modal').modal 'hide'
    @enableSubmitButton()