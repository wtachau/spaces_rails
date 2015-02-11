# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


Spaces.updateUserForm = () ->
	$.ajax
		url: 'users/update_form'
		type: 'GET'
		success: (data, textStatus, jqXHR) ->
			($ '#profilePopup .post_form').html data
		error: (jqXHR, textStatus, errorThrown) ->
			console.log "Error updating form: #{errorThrown}"