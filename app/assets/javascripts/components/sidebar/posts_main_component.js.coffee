# @state.posts is an array of json objects describing posts
window.PostsMainComponent = React.createClass
	render: ->
		class_name = if @props.postsAreRelevant then "relevant_posts" else "all_posts"
		return(
				<div>
					<div className={"overflow_section "+class_name}>
						{"A BUNCH OF POSTS GO HERE"}
					</div>
				</div>
		)