React = require 'react'
{ div, img, form, input } = React.DOM

ProjectCreateComponent = React.createClass 

	getInitialState: ->
		{ name: "", problem: "", solution: "", info: "", github: "", dropbox: "", link: "", inProgress: false }
	
	handleChange: (e) ->
		switch e.target.name
			when "name" then @setState({name: e.target.value})
			when "problem" then @setState({problem: e.target.value})
			when "solution" then @setState({solution: e.target.value})
			when "info" then @setState({info: e.target.value})
			when "github" then @setState({github: e.target.value})
			when "dropbox" then @setState({dropbox: e.target.value})
			when "link" then @setState({link: e.target.value})

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
				success: (data) =>
					@props.onCreate data.project.id

				error: (jqXHR, textStatus, errorThrown) ->
					@setState { inProgress:false }
					console.log "Error updating posts: "+errorThrown
	render: ->
		sidebarInputs = [{name: "github", stateValue: @state.github},
						 {name: "dropbox", stateValue: @state.dropbox},
						 {name: "link", stateValue: @state.link}]
		mainInputs = [{name: "problem", title: "Problem", placeholder: "Tell us what problem you are solving", stateValue: @state.problem},
					  {name: "solution", title: "Solution", placeholder: "How are you going to solve the problem?", stateValue: @state.solution},
					  {name: "info", title: "More Info", placeholder: "More information...", stateValue: @state.info}]
		publishDisplay = if @state.inProgress then img(className:"loading" ) else "Publish"
		div {className: "body_area"},
			div {className: "main-panel main-panel-create"}, 
				form {},
					input {name:"name", type:"text", value:@state.name, onChange:@handleChange, placeholder:"Name your project or idea"},
					div {className:"submit-holder", onClick:@publish, publishDisplay}, "Test"
			div {className: "sidebar"}, "test"
		


module.exports = ProjectCreateComponent