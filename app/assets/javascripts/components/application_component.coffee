
@ApplicationComponent = React.createClass

	getInitialState: ->
		{ user: null, page: 'feed', selectedProject: null }

	componentWillMount: ->
		$.ajax
			url: "/user"
			dataType: 'json'
			cache: false
			success: (data) =>
				@setState(user: data)
			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error getting user: "+errorThrown

	createClicked: () ->
		@setState { page: 'project', selectedProject: null }

	homeClicked: () ->
		@setState { page: 'feed' }

	goToProject: (projectID) ->
		@setState { page: 'project', selectedProject: projectID  }

	projectClicked: (e) ->
		@goToProject $(e.target).data('project-id')

	pageComponent: ->
		switch @state.page
			when 'feed' then <MainFeedComponent projectClicked={@projectClicked}/>
			when 'project' then (if @state.selectedProject then <ProjectViewComponent project={@state.selectedProject} /> else <ProjectCreateComponent onCreate={@goToProject}/>)

	render: ->
		if @state.user then (
			<div>
				<HeaderComponent homeClicked={@homeClicked} createClicked={@createClicked} user={ @state.user }/>
				{ @pageComponent() }
			</div>
		) else <div className="loading">loading</div>