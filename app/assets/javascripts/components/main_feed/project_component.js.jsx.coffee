window.ProjectComponent = React.createClass
	propTypes:
		project: React.PropTypes.shape
			id: 	React.PropTypes.number.isRequired
			name: 	React.PropTypes.string.isRequired

		user: 	 React.PropTypes.object.isRequired

	render: ->

		tag_list = @props.project.tag_list.map (tag) ->
			<span key={tag}>{tag}, </span> 

		<div className="feed-post">
			<div className="row">
				<div className="profile-container username-link" user-id={@props.user.id}>
					<img className="profilepic-small" src={@props.user.image+"?sz=100"}></img>
					<div className="profile-text-wrapper">
						<div className="username"> 
							{ @props.user.first_name } { @props.user.last_name }
						</div>
						<div className="timestamp">
							{ @props.project.time_ago } ago
						</div>
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

				<div onClick={ @props.projectClicked } data-project-id={@props.project.id} className="project-details-link">Details></div>

				<div className="project-footer">
					<div className="feedback">
						Feedback: <a href="/comments"><span className="feedback-number">({ @props.project.numComments })</span></a>
					</div>
					<div className="tags">
						Tags: <span className="tags-text">{ tag_list }</span>
					</div>
				</div>
			</div>
			<div className="feed-separator"></div>
			
		</div>