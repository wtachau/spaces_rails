window.PostComponent = React.createClass
	propTypes:
		project: React.PropTypes.shape
					id: React.PropTypes.number.isRequired
					name: React.PropTypes.string.isRequired

		user: 	 React.PropTypes.object.isRequired

		post: 	 React.PropTypes.shape
					id: 			React.PropTypes.number.isRequired
					num_comments: 	React.PropTypes.number.isRequired
					text: 			React.PropTypes.string.isRequired

	componentWillMount: ->
		@id = @getNewID()

	componentDidMount: ->
		@bindAjaxController

	bindAjaxController: ->
		ticket_container = '#' + @id
		new Spaces.AjaxLinkController ticket_container, (data) ->
			($ '.main_panel_content').html data

	# create a random id for each post component between 0 and 99999
	# as Math.random is lower-bound inclusive, upper-bound exclusive
	getNewID: ->
		Math.floor ( Math.random() * 100000 )

	postClicked: ->
		($ 'body').trigger 'postClicked', @props.post.id

	render: ->
		return (
			<div className={ "ticket_box ticket-" + @props.post.id } id={ @id } project={ @props.project.id }>
				<a onClick={ @postClicked }>
					<div className="container-fluid">
						<div className="row">
							<div className="col-md-3">
								<ProfileSnippetComponent user={ @props.user }/>
							</div>
							<div className="col-md-9 ticket_description">
								<div className="ticket_icon">
									<div className="num_comments badge"> 
										{ @props.post.num_comments }
									</div>
								</div>
								<div className="description">
									{ @props.post.text }
								</div>
							
								<div className="project_name">
									[ { @props.project.name } ]
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>
		)