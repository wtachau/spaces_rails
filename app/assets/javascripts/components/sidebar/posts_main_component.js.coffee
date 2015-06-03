# @state.posts is an array of json objects describing posts
window.PostsMainComponent = React.createClass
	getInitialState: ->
		{posts_json: []}

	componentWillMount: ->
		@loadPostsFromServer()
	
	componentDidMount:->
		@pollServer()	

	loadPostsFromServer: ->
		url = 'posts' + (if @props.postsAreRelevant then '/relevant' else '')
		return $.ajax
			url: url+ '.json'
			dataType: 'json'
			cache: false
			success: (posts) =>
				@setState {posts_json: posts}

			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error updating posts: "+errorThrown


	pollServer: ->
		setInterval(@loadPostsFromServer, @props.pollInterval)

	render: ->
		postClass = if @props.postsAreRelevant then "relevant_posts" else "all_posts"
		postNodes = @state.posts_json.map (data)->
			# see app/views/posts/_post.json.jbuilder for structure of data
			return(
				<PostComponent post={ data.post } user={ data.user } project={ data.project } key={ data.post.id } />
			)
		return(
				<div className = {@props.className}>
					<div className={ "overflow_section " + postClass } >
						<div className={ "posts" }>
							{postNodes}
						</div>
					</div>
				</div>
		)
