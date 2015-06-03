window.PostsHeaderComponent = React.createClass
	render: ->
		return (
			 <div {...@props} ><div>{ @props.text }</div></div> 
		)