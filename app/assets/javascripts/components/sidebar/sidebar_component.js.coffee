window.SidebarComponent = React.createClass
	render: ->
		pollInterval = 5000
		relevantFactor = 2
		return( 
			<div className="sidebar_wrapper">
				<PostsHeaderComponent text={ "posts relevant to you" } className={ "section_header skills"} />
				<PostsMainComponent className={ "left_section skills" } url={ "posts/relevant" } pollInterval={ relevantFactor * pollInterval }/>

				<PostsHeaderComponent text={ "most recent posts" } className={ "section_header all"} />
				<PostsMainComponent className={ "left_section all"} url={ "posts" } pollInterval={ pollInterval }/>
			</div>
		)
