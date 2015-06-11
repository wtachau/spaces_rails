window.MainFeedComponent = React.createClass

	getInitialState: ->
		{projects: []}

	componentWillMount: ->
		@loadProjectsFromServer()
	
	componentDidMount:->
		@pollServer()	

	loadProjectsFromServer: ->
		return $.ajax
			url: "projects"
			dataType: 'json'
			cache: false
			success: (projects) =>
				if @isMounted()
					@setState {projects: projects}

			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error updating projects: "+errorThrown

	pollServer: ->
		setInterval @loadProjectsFromServer, 5000

	render: ->
		projectNodes = @state.projects.map (data)->
			# see app/views/posts/_post.json.jbuilder for structure of data
			return(
				<ProjectComponent user={ data.user } project={ data.project } key={ data.project.id }/>
			)
		<div className="main-panel main-panel-feed">
			<div className="feed-posts">
				{ projectNodes }
			</div>
		</div>
