PostsComponent = React.createClass
	render: ->
		return(
			`
			<div>
				<PostsHeaderComponent text={'posts relevant to you'} relevantHeader={this.props.postsAreRelevant} className={"section_header skills"} />
				<PostsMainComponent className={"left_section skills"} postsAreRelevant={this.props.postsAreRelevant} />
			</div>
			`
			)
