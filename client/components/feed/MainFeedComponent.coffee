React = require "react"

{ div } = React.DOM

MainSidebarComponent = React.createClass
  render: ->
    div className:"sidebar sidebar-main",
      div className:"sidebar-header", "most recent activity"

MainFeedComponent = React.createClass

  getInitialState: ->
    {projects: []}

  componentWillMount: ->
    @loadProjectsFromServer()
  
  componentDidMount:->
    @pollServer() 

  loadProjectsFromServer: ->
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
      React.createElement MainSidebarComponent

module.exports = MainFeedComponent