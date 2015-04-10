#= require './view_controller'

# Used to control ajax callbacks on remote links
class Spaces.AjaxLinkController extends Spaces.ViewController

 	initialize: ([ @callback ]) ->
 		# If container doesn't have an anchor, it is the anchor
 		(if (@$container.find 'a').length == 0 then (@$container) else (@$container.find 'a'))
 			.on('ajax:success', @onSuccess)
			.on('ajax:error', @onFailure)

 	onSuccess: (e, data, status, xhr) =>
 		if @callback 
 			@callback data

	onFailure: (e, jqXHR, settings, error) =>
		console.log "Error on ajax response: #{error}"
