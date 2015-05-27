SidebarComponent = React.createClass
	render: ->
		return(
			`
			<div className="left_panel body_panel"
				<PostsComponent postsAreRelevant={true} />
				<PostsComponent postsAreRelevant={false} />
			</div>
			`
		)