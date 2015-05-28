# expecting state fields ticket_id, random_id, num_comments, project_name 
PostComponent = React.createClass
	render: ->
		return (
			`
			<div className={"ticket_box "+this.state.ticket_id} id={this.state.random_id} project={this.state.project_id}>
				// will be part of react component.... callback maybe?
				= link_to preview_post_path(post), remote:true
				<div className="container-fluid">
					<div className="row">
						<div className="col-md-3">
							<ProfileSnippetComponent setState={this.state.user}/>
						</div>
						<div className="col-md-9 ticket_description">
							<div className="ticket_icon">
								<div className="num_comments badge"> 
									{this.state.num_comments}
								</div>
							</div>
							<div className="description">
								{this.state.text}
							</div>
							{/*.project_name() [ #{post.project.name} ]*/}
							<div className="project_name">
								[ {this.state.project_name} ]
							</div>
						</div>
					</div>
				</div>
			</div>
			`
		)
		
	componentDidMount: ->
		bindAjaxController

	bindAjaxController: ->
		ticket_container = '#' + this.state.random_id
		new Spaces.AjaxLinkController ticket_container, (data) ->
			($ '.main_panel_content').html data
