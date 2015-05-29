# @state.posts is an array of json objects describing posts
window.PostsMainComponent = React.createClass
	getInitialState: ->
		{posts_json: []}

	componentDidMount: ->
		@loadPostsFromServer()
		

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
		setInterval @loadPostsFromServer, @props.pollInterval

	render: ->
		class_name = if @props.postsAreRelevant then "relevant_posts" else "all_posts"
		@loadPostsFromServer()
		postNodes = @state.posts_json.map (data)->
			# see app/views/posts/_post.json.jbuilder for structure of data
			return(
				<PostComponent post={ data.post } user={ data.user } project={ data.project } key={ data.post.id } />
			)
		return(
				<div>
					<div className={"overflow_section "+class_name}>
						{postNodes}
					</div>
				</div>
		)
