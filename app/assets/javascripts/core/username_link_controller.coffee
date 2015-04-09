#= require './view_controller'

class Spaces.UsernameLinkController extends Spaces.ViewController

	initialize: ->
		($ document).on 'click', '.username_link', ->
			showUserPopup $(@).attr "user_id"
			
	showUserPopup = (user) =>
		($ '#userPopup').modal 'show'
		$.ajax
			url: "users/#{user}/popup"
			type: 'GET'
			success: (data) ->
				($ '#userPopup .modal-content').html data
				