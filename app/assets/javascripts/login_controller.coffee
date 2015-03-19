class Spaces.LoginController

	signinCallback: (authResult) ->
		if authResult['hd'] != "originate.com"
			console.log "not originate"
			disconnectUser authResult['access_token']
		else 
			if authResult['status']['signed_in']
				# get user info
				gapi.client.load 'plus', 'v1', () ->
					request = gapi.client.plus.people.get {'userId':'me'}
					request.execute (resp) ->
						$.ajax
							url: 		'users'
							type:		'POST'
							data:		resp
							success:	(data, textStatus, jqHXR) ->
											document.location = '/';
							error:		(jqXHR, textStatus, errorThrown) ->
											alert("Error: "+ errorThrown)
			else
				console.log "Error: Failed login"

	signedinCallback: (authResult) ->
		($ "#logout").fadeIn(1)