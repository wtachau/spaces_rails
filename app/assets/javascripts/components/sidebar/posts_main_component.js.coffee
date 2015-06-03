window.PostsMainComponent = React.createClass
	propTypes:{
		className: 	  React.PropTypes.string.isRequired
		url: 		  React.PropTypes.string.isRequired
		pollInterval: React.PropTypes.number.isRequired
		initialPosts: React.PropTypes.array
	},
	getDefaultProps: ->
		return {initialPosts: []}

	getInitialState: ->
		{posts: @props.initialPosts}

	componentWillMount: ->
		@loadPostsFromServer()
	
	componentDidMount:->
		@pollServer()	

	loadPostsFromServer: ->
		return $.ajax
			url: @props.url
			dataType: 'json'
			cache: false
			success: (posts) =>
				@setState {posts: posts}

			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error updating posts: "+errorThrown


	pollServer: ->
		setInterval @loadPostsFromServer, @props.pollInterval

	render: ->
		postClass = if @props.postsAreRelevant then "relevant_posts" else "all_posts"
		postNodes = @state.posts.map (data)->
			# see app/views/posts/_post.json.jbuilder for structure of data
			return(
				<PostComponent post={ data.post } user={ data.user } project={ data.project } key={ data.post.id } />
			)
		return(
				<div className={ @props.className }>
					<div className={ "overflow_section " + postClass } >
						<div className={ "posts" }>
							{postNodes}
						</div>
					</div>
				</div>
		)
