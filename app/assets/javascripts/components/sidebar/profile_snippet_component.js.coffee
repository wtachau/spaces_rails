# relies on state with fields user_id, user_img, first_name
ProfileSnippetComponent = React.createClass
	render: ->
			<div className="profile_container username_link" user_id={this.state.user_id}>
				<img className="profilepic_small" src={this.state.user_img+"?sz=100"}></img>
				<div className="ticket_name"> 
					{this.state.first_name} 
				</div>
			</div>