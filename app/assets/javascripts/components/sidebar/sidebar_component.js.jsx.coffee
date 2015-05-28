SidebarComponent = React.createClass
	render: ->
		pollInterval = 2000
		relevantFactor = .75
		return(
			`
			<div className="left_panel body_panel">
				{/* the relevant-post feed*/}
				<PostsFeedComponent postsAreRelevant={true} pollInterval={relevantFactor*pollInterval}/>
				{/* the recent-post feed*/}
				<PostsFeedComponent postsAreRelevant={false} pollInterval={(1/relevantFactor)*pollInterval}/>
			</div>
			`
		)