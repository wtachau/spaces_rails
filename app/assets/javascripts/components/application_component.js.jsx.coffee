@ApplicationComponent = React.createClass

	propTypes:
		user: 	 React.PropTypes.object.isRequired

	getInitialState: ->
		{ page: 'feed', selectedProject: null }

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
		<div>
			<HeaderComponent createClicked={@createClicked} homeClicked={@homeClicked} user={ this.props.user }/>
			{ @pageComponent() }
		</div>