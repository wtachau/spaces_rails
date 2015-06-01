window.SidebarComponent = React.createClass
	render: ->
		pollInterval = 2000
		relevantFactor = .75		
		return( 
			<div className="sidebar_wrapper">
				<PostsHeaderComponent text={ "posts relevant to you" } className={ "section_header skills"} />
				<PostsMainComponent className={ "left_section skills" } postsAreRelevant={ true } />

				<PostsHeaderComponent text={ "most recent posts" } className={ "section_header all"} />
				<PostsMainComponent className={ "left_section all"} postsAreRelevant={ false } />
			</div>
		)


		#return(
		#	<div className="left_panel body_panel">
		#		<PostsFeedComponent postsAreRelevant={true} pollInterval={ relevantFactor * pollInterval } />
		#		<PostsFeedComponent postsAreRelevant={false} pollInterval={ (1 / relevantFactor) * pollInterval } />
		#	</div>
		#)