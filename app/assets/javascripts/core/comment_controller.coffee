#= require './view_controller'

class Spaces.CommentsController extends Spaces.ViewController

	initialize: ([ @names ]) ->
		@$container.on 'commentAdded', (event, data) => 
			@addCommentToPost data
		@addTagListener()
		@addUploadPreview()

	addCommentToPost: (data) =>
		($ '.previous_comments').append data
		($ '.comments form textarea').val ""
		($ '.comments form .textoverlay').html ""
		($ '#image_preview')[0].style.backgroundImage = null
		($ '#image_preview').attr 'class', 'original'

	addTagListener: =>
		# https://github.com/yuku-t/jquery-textcomplete 
		$.ajax
			url: 'users/allnames'
			type: 'GET'
			success: (data) ->
				$('#new_comment textarea').textcomplete([ {
					mentions: data
					match: /\B@(\w*)$/
					search: (term, callback) ->
						callback $.map(@mentions, (mention) ->
							if mention.toLowerCase().indexOf(term.toLowerCase()) >= 0 then mention else null
						)
					index: 1
					replace: (mention) ->
						'@' + mention + ' '

				} ], appendTo: 'body').overlay [ {
				  match: /\B@\w+/g
				  css: {'background-color': '#d8dfea', 'border-radius': '4px'}
				} ]
			error: ->
				console.log "Error getting all names"

	addUploadPreview: =>
		($ "form#new_comment input[type='file']").change @readURL

	readURL: (event) ->
		input = event.target
		if input.files and input.files[0]
			reader = new FileReader
			reader.onload = (e) ->
				($ '#image_preview').attr 'class', ''
				($ '#image_preview')[0].style.backgroundImage = "url('"+e.target.result+"')"
			reader.readAsDataURL input.files[0]