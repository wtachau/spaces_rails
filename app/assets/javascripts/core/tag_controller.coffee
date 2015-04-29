#= require './view_controller'

class Spaces.TagController extends Spaces.ViewController

	initialize: ->
		($ document).on 'click', '.tag_link', ->
			showPostPopup encodeURIComponent $(@).html()
			
	showPostPopup = (tag_text) =>
		($ '#postsByTag').modal 'show'
		$.ajax
			url: "posts/tagged/#{tag_text}"
			type: 'GET'
			success: (data) ->
				($ '#postsByTag .modal-content').html data
				