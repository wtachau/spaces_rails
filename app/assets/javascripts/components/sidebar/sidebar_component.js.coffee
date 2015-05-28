window.SidebarComponent = React.createClass
	render: ->
		pollInterval = 2000
		relevantFactor = .75
		return(
			<div className="left_panel body_panel">
				<PostsFeedComponent postsAreRelevant={true} pollInterval={ relevantFactor * pollInterval } />
				<PostsFeedComponent postsAreRelevant={false} pollInterval={ (1 / relevantFactor) * pollInterval } />
			</div>
		)