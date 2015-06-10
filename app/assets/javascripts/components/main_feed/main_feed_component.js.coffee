window.MainFeedComponent = React.createClass

	getInitialState: ->
		{posts: []}

	componentWillMount: ->
		@loadPostsFromServer()
	
	componentDidMount:->
		@pollServer()	

	loadPostsFromServer: ->
		return $.ajax
			url: "posts"
			dataType: 'json'
			cache: false
			success: (posts) =>
				@setState {posts: posts}

			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error updating posts: "+errorThrown

	pollServer: ->
		setInterval @loadPostsFromServer, 5000

	render: ->
		postNodes = @state.posts.map (data)->
			# see app/views/posts/_post.json.jbuilder for structure of data
			return(
				<PostComponent post={ data.post } user={ data.user } project={ data.project } key={ data.post.id } />
			)
		<div className="main-panel main-panel-feed">
			<div className="posts">
				{ postNodes }
			</div>
		</div>
