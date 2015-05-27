PostsMainComponent = React.createClass
	render: ->
		class = if @props.postsAreRelevant then "relevant_posts" else "all_posts"
		return(
			`
				<div>
					<div className={"overflow_section "+class}>
						<div className="posts">
							{for (post in this.state.posts){
								(function() {
									return (<Post setState={post}/>)
								})();
							}
							}
						</div>
					</div>
				</div>
			`
		)