Link = ReactRouter.Link

@HeaderComponent = React.createClass
	propTypes: 
		user: React.PropTypes.shape
			id:        React.PropTypes.number.isRequired
			image:       React.PropTypes.string.isRequired
			first_name: React.PropTypes.string.isRequired

	render: ->
		<div>
			<nav className="navbar navbar-fixed-top">
				<div className="container-fluid header">
					<div className="logo"> Spaces </div>
					<div id="add_profile" className="upper_right">
						<img className="profile" src={this.props.user.image+"?sz=100"} data-toggle="modal" data-target="#profilePopup"></img>
					</div>
					<div onClick={@props.createClicked} className="create-button">Create</div>
					<div className="header-links">
					
					</div>
				</div>
			</nav>

			<div id="profilePopup" className="modal fade popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div className="modal-dialog">
					<div className="modal-content">
						<div className="modal-header">
							<button type="button" className="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 className="modal-title" id="myModalLabel"> name here</h4>
						</div>
						<div className="modal-body">
							<img className="profileImage" src={@props.user.image+"?sz=100"}></img>
							<div className="post_form">
								
							</div>
						</div>
						<div className="modal-footer">
							
							<span id="signinButton" className="hidden">
								<span className="g-signin"
									data-callback="signinCallback"
									data-clientid="1058509999201-n23gtmm967b4itcgdnjplr22l7ve7qb7.apps.googleusercontent.com"
									data-cookiepolicy="single_host_origin"
									data-requestvisibleactions=""
									data-scope="openid email"></span>
							</span>
							<div id="logout" style={{display:"none"}}> sign out</div>
						</div>
					</div>
				</div>
			</div>
		</div>					