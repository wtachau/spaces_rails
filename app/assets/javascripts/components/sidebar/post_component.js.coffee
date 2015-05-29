# expecting state fields text, ticket_id, random_id, num_comments, project_name, user
window.PostComponent = React.createClass
	render: ->
		##// will be part of react component.... callback maybe? = link_to preview_post_path(post), remote:true
		return (
			#<div className={"ticket_box "+this.props.post.ticket_id} id={this.state.random_id} project={this.state.project_id}>
			<div className={ "ticket_box " + 981234 } id={ this.props.post.random_id } project={ this.props.post.project_id }>
				<div className="container-fluid">
					<div className="row">
						<div className="col-md-3">
							<ProfileSnippetComponent setState={ this.props.post.user }/>
						</div>
						<div className="col-md-9 ticket_description">
							<div className="ticket_icon">
								<div className="num_comments badge"> 
									{this.props.post.num_comments}
								</div>
							</div>
							<div className="description">
								{this.props.post.long}
							</div>
							
							<div className="project_name">
								[ {this.props.post.project_name} ]
							</div>
						</div>
					</div>
				</div>
			</div>
		)
		# .project_name() [ #{post.project.name} ] 

	componentDidMount: ->
		@bindAjaxController

	bindAjaxController: ->
		ticket_container = '#' + this.props.post.random_id
		new Spaces.AjaxLinkController ticket_container, (data) ->
			($ '.main_panel_content').html data
