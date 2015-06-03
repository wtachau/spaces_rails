window.ProfileSnippetComponent = React.createClass
	propTypes: 
		user: React.PropTypes.shape
			id:        React.PropTypes.number.isRequired
			img:       React.PropTypes.string.isRequired
			firstName: React.PropTypes.string.isRequired
			
	render: ->
		<div className="profile_container username_link" user_id={this.props.user.id}>
			<img className="profilepic_small" src={this.props.user.img+"?sz=100"}></img>
			<div className="ticket_name"> 
				{ this.props.user.firstName } 
			</div>
		</div>