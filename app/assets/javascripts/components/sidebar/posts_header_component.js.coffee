window.PostsHeaderComponent = React.createClass
	render: ->
		return (
			 <div className={"section_header " + @props.suppClass }  > <div> { @props.text } </div> </div> 
		)