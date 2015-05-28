# @state.posts is an array of json objects describing posts
PostsMainComponent = React.createClass
	render: ->
		class_name = if @props.postsAreRelevant then "relevant_posts" else "all_posts"
		return(
			`
				<div>
					<div className={"overflow_section "+class_name}>
						<div className="posts">
							{(function(){
								for (post in this.state.posts){
									(function() {
										return (<PostComponent setState={post}/>)
									})();
								}
							})()}
						</div>
					</div>
				</div>
			`
		)