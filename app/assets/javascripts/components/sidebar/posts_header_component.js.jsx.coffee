PostsHeaderComponent = React.createClass
	render: ->
		text = if @props.relevantHeader then "posts relevant to you" else "most recent posts"
		return (
			`
				<div> <div> {text} </div> </div>
			`
		)