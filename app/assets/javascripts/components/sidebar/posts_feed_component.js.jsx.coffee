## makes ajax calls to update state and maintain visual
PostsFeedComponent = React.createClass
	render: ->
		return(
			`
			<div>
				<PostsHeaderComponent text={'posts relevant to you'} relevantHeader={this.props.postsAreRelevant} className={"section_header skills"} />
				<PostsMainComponent className={"left_section skills"} setState={this.state} postsAreRelevant={this.props.postsAreRelevant} />
			</div>
			`
			)
	
	getInitialState: ->
		{data: []}

	componentDidMount: ->
		@loadPostsFromServer
		@pollServer

	loadPostsFromServer: ->
		# ajax call

	pollServer: ->
		setInterval @loadPostsFromServer, @props.pollInterval
