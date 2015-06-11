@MainCreateComponent = React.createClass

	getInitialState: ->
		{ name: "", problem: "", solution: "", info: "", inProgress: false }
	
	handleChange: (e) ->
		switch e.target.name
			when "name" then @setState({name: e.target.value})
			when "problem" then @setState({problem: e.target.value})
			when "solution" then @setState({solution: e.target.value})
			when "info" then @setState({info: e.target.value})

	publish: (e) ->
		e.preventDefault()
		unless @state.inProgress
			@setState { inProgress:true }
			$.ajax
				url: "/projects"
				dataType: 'json'
				method: 'POST'
				cache: false
				data: @state
				success: () =>
					@setState { inProgress:false }
				error: (jqXHR, textStatus, errorThrown) ->
					@setState { inProgress:false }
					console.log "Error updating posts: "+errorThrown

	render: ->
		publishDisplay = if @state.inProgress then <img className="loading"></img> else "Publish"

		<div className="main-panel main-panel-create">
			<form>
				<input name="name" type="text" value={@state.name} onChange={@handleChange} placeholder="Name your project or idea"/>
				<div className="create-header">Problem:</div>
				<textarea name="problem" value={@state.problem} onChange={@handleChange} placeholder="Tell us what problem you are exploring..."/>
				<div className="create-header">Solution:</div>
				<textarea name="solution" value={@state.solution} onChange={@handleChange} placeholder="How are you going to solve this problem?"/>
				<div className="create-header">More info:</div>
				<textarea name="info" value={@state.info} onChange={@handleChange} placeholder="More information..."/>
				<div className="submit-holder" onClick={@publish}>{ publishDisplay }</div>
			</form>
		</div>
