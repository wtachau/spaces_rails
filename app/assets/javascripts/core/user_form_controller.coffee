#= require './view_controller'

class Spaces.UserFormController extends Spaces.ViewController

	initialize: ->
		# Update the user form tags when a post is added
		($ 'body').on 'postAdded', () ->
			updateUserForm()
		# Hide modal and update user form when it is submitted
		($ 'body').on 'userUpdated', () ->
			userFormSubmitted()
		# If the form has a counter, update it
		($ '#post_short').keyup (e) ->
			($ '.counter').html ($ @).val().length 

	userFormSubmitted = () ->
		($ '.modal').modal 'hide'
		updateUserForm()

	updateUserForm = () ->
		$.ajax
			url: 'users/edit'
			type: 'GET'
			success: (data, textStatus, jqXHR) ->
				($ '#profilePopup .post_form').html data
			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error updating form: #{errorThrown}"