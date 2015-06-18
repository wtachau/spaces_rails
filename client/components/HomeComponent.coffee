React = require "react"
HeaderComponent = require("./header/HeaderComponent")
MainFeedComponent = require("./feed/MainFeedComponent")

{ div, h1, p, a} = React.DOM

HomeComponent = React.createClass

  getInitialState: ->
    { user: null, page: 'feed', selectedProject: null }

  componentWillMount: ->
    @props.readFromAPI @props.origin + '/user', (data) =>
      @setState(user: data)

  createClicked: () ->
    @setState { page: 'project', selectedProject: null }

  homeClicked: () ->
    @setState { page: 'feed' }

  goToProject: (projectID) ->
    @setState { page: 'project', selectedProject: projectID  }

  projectClicked: (e) ->
    @goToProject $(e.target).data('project-id')

  render: ->
    pageComponent = switch @state.page
        when 'feed' then React.createElement MainFeedComponent,  {@projectClicked, origin:@props.origin, readFromAPI:@props.readFromAPI}
        when 'project' then (if @state.selectedProject
            React.createElement ProjectViewComponent, {project:@state.selectedProject}
          else 
            React.createElement ProjectCreateComponent, { onCreate:@goToProject } )

    div {},
      ( React.createElement HeaderComponent,
        {@homeClicked, @createClicked, user: @state.user} ),
      pageComponent
      
module.exports = HomeComponent