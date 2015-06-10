window.PostComponent = React.createClass
	propTypes:
		project: React.PropTypes.shape
					id: 	React.PropTypes.number.isRequired
					name: 	React.PropTypes.string.isRequired

		user: 	 React.PropTypes.object.isRequired

		post: 	 React.PropTypes.shape
					id:				React.PropTypes.number.isRequired
					numComments: 	React.PropTypes.number.isRequired
					text:			React.PropTypes.string.isRequired

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

	# use with <a onClick={ @postClicked }>
	# postClicked: ->
	# 	($ 'body').trigger 'postClicked', @props.post.id

	render: ->
		github = if @props.project.github then <div>asdf</div> else null

		<div className="feed-post">
			<div className="row">
				<div className="profile-container username-link" user-id={@props.user.id}>
					<img className="profilepic-small" src={@props.user.img+"?sz=100"}></img>
					<div className="username"> 
						{ @props.user.firstName } { @props.user.lastName }
					</div>
				</div>
				<div className="feed-links">
					{ if @props.project.github then ( <a href=@props.project.github><i className="fa fa-github fa-3x"></i></a> ) else null }
					{ if @props.project.dropbox then ( <a href=@props.project.dropbox><i className="fa fa-dropbox fa-3x"></i></a> ) else null }
				</div>
			</div>
			<div className="row">
				<div className="project-title">
					{ @props.project.name }
				</div>

				<div className="row">
					<div className="project-desc-label"> Problem: </div>
					<div className="project-desc"> { @props.project.problem } </div>
				</div>

				<div className="row">
					<div className="project-desc-label"> Solution: </div>
					<div className="project-desc"> { @props.project.solution } </div>
				</div>

				<a href="/details"><div className="project-details-link">Details></div></a>

				<div className="project-footer">
					<div className="feedback">
						Feedback: <a href="/comments"><span className="feedback-number">({ @props.post.numComments })</span></a>
					</div>
					<div className="tags">
						Tags: <span className="tags-text">One, Two, Three</span>
					</div>
				</div>
			</div>
			<div className="feed-separator"></div>
		</div>