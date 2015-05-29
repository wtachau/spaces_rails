# relies on state with fields user_id, user_img, first_name
window.ProfileSnippetComponent = React.createClass
	render: ->
		<div className="profile_container username_link" user_id={this.props.user.id}>
			<img className="profilepic_small" src={this.props.user.img+"?sz=100"}></img>
			<div className="ticket_name"> 
				{ this.props.user.first } 
			</div>
		</div>