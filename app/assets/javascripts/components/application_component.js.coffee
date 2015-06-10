@ApplicationComponent = React.createClass

	propTypes:
		user: 	 React.PropTypes.object.isRequired

	render: ->
		return (
			<div>
				<HeaderComponent user={ @props.user }/>
				<div className="body_area">
					<MainFeedComponent/>
					<MainSidebarComponent/>
				</div>
			</div>
		)

