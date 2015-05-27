PostsHeaderComponent = React.createClass
	render: ->
		text = if this.props.relevantHeader then "posts relevant to you" else "most recent posts"
		return (
			`
				<div> <div> {text} </div> </div>
			`
		)