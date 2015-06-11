@ApplicationComponent = React.createClass

	propTypes:
		user: 	 React.PropTypes.object.isRequired

	getInitialState: ->
		{ page: 'feed'}

	createClicked: () ->
		@setState { page: 'create' }

	homeClicked: () ->
		@setState { page: 'feed' }

	pageComponent: ->
		switch @state.page
			when 'feed' then <MainPageComponent/>
			when 'create' then <CreateComponent/>

	render: ->
		<div>
			<HeaderComponent createClicked={@createClicked} homeClicked={@homeClicked} user={ this.props.user }/>
			{ @pageComponent() }
		</div>

@MainPageComponent = React.createClass
	render: ->
		<div className="body_area">
			<MainFeedComponent/>
			<MainSidebarComponent/>
		</div>