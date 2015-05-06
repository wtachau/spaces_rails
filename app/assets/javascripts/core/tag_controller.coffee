#= require './view_controller'

class Spaces.TagController extends Spaces.ViewController

	initialize: ->
		($ document).on 'click', '.tag_link', ->
			showPostPopup encodeURIComponent $(@).html()
			
	showPostPopup = (tag_text) =>
		($ '#projectsByTag').modal 'show'
		$.ajax
			url: "projects/tagged/#{tag_text}"
			type: 'GET'
			success: (data) ->
				($ '#projectsByTag .modal-content').html data
				