window.PostsHeaderComponent = React.createClass
	render: ->
		return (
			 <div className= {@props.className}><div>{@props.text}</div></div> 
		)