React = require "react"

{ div } = React.DOM

MainFeedComponent = React.createClass

  getInitialState: ->
    {projects: []}

  componentWillMount: ->
    @loadProjectsFromServer()
  
  componentDidMount:->
    @pollServer() 

  loadProjectsFromServer: ->
    console.log @props
    @props.readFromAPI @props.origin + '/projects', (data) =>
      @setState(projects: data.projects)

  pollServer: ->
    # setInterval @loadProjectsFromServer, 5000

  render: ->
    projectNodes = @state.projects.map (data) =>
      # see app/views/posts/_post.json.jbuilder for structure of data
      return(
        div {}, "hello"
        # <ProjectComponent user={ data.user } project={ data } projectClicked={@props.projectClicked} key={ data.id }/>
      )
    div {className:"body_area"},
      div {className:"main-panel main-panel-feed"},
        div {className:"feed-posts"},
          projectNodes
      div {}, "sidebar"
      # React.createElement MainSidebarComponent

module.exports = MainFeedComponent