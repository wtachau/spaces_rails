## makes ajax calls to update state and maintain visual
window.PostsFeedComponent = React.createClass
	render: ->
		return( 
			header_text = if @props.postsAreRelevant then "posts relevant to you" else "most recent posts"
			<div>
				<PostsHeaderComponent text={ header_text } className={ "section_header skills" } />
				<PostsMainComponent className={ "left_section skills" } postsAreRelevant={ this.props.postsAreRelevant } />
			</div>
		)
	
