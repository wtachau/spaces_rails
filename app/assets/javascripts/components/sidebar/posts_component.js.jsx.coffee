PostsComponent = React.createClass
	render: ->
		return(
				`
				<PostsHeaderComponent text={'posts relevant to you'} className={"section_header skills"} />
				<PostsMainComponent className={"left_section skills"} postsAreRelevant={this.props.postsAreRelevant}/>
				`
			)
