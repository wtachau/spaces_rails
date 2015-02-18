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

  enableSubmitButton: (e, jqXHR, settings, error) =>
    @$submitButton.prop 'disabled', false

  formSucceeded: (e, data, status, xhr) =>
    @enableSubmitButton()
    if @callback
        @callback(data)
    
# Used to control ajax callbacks on remote links
class Spaces.AjaxLinkController extends Spaces.ViewController

  initialize: ([ @callback ]) ->
    (@$container.find 'a')
      .on('ajax:success', @onSuccess)
      .on('ajax:error', @onFailure)

  onSuccess: (e, data, status, xhr) =>
    if @callback
      @callback(data)

  onFailure: (e, jqXHR, settings, error) =>
    console.log "Error on ajax response: #{error}"
