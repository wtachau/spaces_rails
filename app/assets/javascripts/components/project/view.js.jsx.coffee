@ProjectViewComponent = React.createClass

	getDefaultState: -> {}

	componentWillMount: ->
		$.ajax
			url: "/projects/" + @props.project
			dataType: 'json'
			cache: false
			success: (data) =>
				@setState(data.project)
			error: (jqXHR, textStatus, errorThrown) ->
				console.log "Error updating posts: "+errorThrown

	render: ->
		if @state then (
			<div className="body-area">
				<div className="main-panel main-panel-project">
					<div className="project-history">
						<div className="project-snapshot">
							<div className="snapshot-icon"></div>
							{ @state.name }
							</div>
					</div>
					<div className="project-panel">
						<div className="profile-wrapper">
							<div className="profile-container">
								<div className="profile-text-wrapper">
									<div className="username"> 
										{ @state.user.first_name } { @state.user.last_name }
									</div>
									<div className="timestamp">
										{ @state.time_ago } ago
									</div>
								</div>
								<img src={ @state.user.image }/>
							</div>
						</div>
						<div className="project-title">{ @state.name }</div>
						<div className="project-section-title">Problem</div>
						<div className="project-section-text">{ @state.problem }</div>
						<div className="project-section-title">Solution</div>
						<div className="project-section-text">{ @state.solution }</div>
						<div className="project-section-title">More info</div>
						<div className="project-section-text">{ @state.info }</div>
					</div>
				</div>
				<div className="sidebar">
					<div className="sidebar-header">Attachments and Links</div>
					{ [{"icon": "github", "link": @state.github}, {"icon": "dropbox", "link": @state.dropbox}].map ({icon, link}) ->
						if link then <SidebarLinkComponent icon={icon} link={link} key={icon}/>}
				</div>
			</div>
			) else <h2>loading</h2>

@SidebarLinkComponent = React.createClass
	render: ->
		<div className="sidebar-link-wrapper">
			<div className="icon-wrapper"><i className={"fa fa-"+@props.icon}></i></div>
			<a href={@props.link} >{ @props.link }</a>
		</div>

