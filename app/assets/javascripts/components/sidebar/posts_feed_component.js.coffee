## makes ajax calls to update state and maintain visual
window.PostsFeedComponent = React.createClass
	render: ->
		return( 
			header_text = if @props.postsAreRelevant then "posts relevant to you" else "most recent posts"
			supplement = if @props.postsAreRelevant then "skills" else "all_posts"
			<div>
				<PostsHeaderComponent text={ header_text } suppClass={ supplement } className={ "section_header skills" } />
				<PostsMainComponent className={ "left_section skills" } postsAreRelevant={ this.props.postsAreRelevant } />
			</div>
		)
	
