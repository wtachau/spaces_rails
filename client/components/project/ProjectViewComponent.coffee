React = require 'react'
Router = require 'react-router'
{ div, img, i, a } = React.DOM

ProjectViewComponent = React.createClass

  mixins: [ Router.State ],

  getDefaultState: -> {}

  componentWillMount: ->
    @props.readFromAPI @props.origin + '/projects/'+@getParams().id, (data) =>
      @setState(data.project)

  render: ->
    console.log @
    if @state then (
      div {className:"body-area"}, 
        div {className:"main-panel main-panel-project"},
          div {className:"project-history col-xs-3"},
            div {className:"project-snapshot"},
              div {className:"snapshot-icon"}
              @state.name
          div {className:"project-panel col-xs-9"},
            div {className:"profile-wrapper"},
              div {className:"profile-container"},
                div {className:"profile-text-wrapper"},
                  div {className:"username"}, @state.user.first_name + " " + @state.user.last_name
                  div {className:"timestamp"}, @state.time_ago + " ago"
                img {src:@state.user.image}
            div {className:"project-title"}, @state.name
            div {className:"project-section-title"}, "Problem"
            div {className:"project-section-text"}, @state.problem
            div {className:"project-section-title"}, "Solution"
            div {className:"project-section-text"}, @state.solution
            div {className:"project-section-title"}, "More info"
            div {className:"project-section-text"}, @state.info
        div {className:"sidebar"},
          div {className:"sidebar-header"}, "Attachments and Links"
          [{"icon": "github", "link": @state.github}, {"icon": "dropbox", "link": @state.dropbox}].map ({icon, link}) ->
            if link then (
              div {className:"sidebar-link-wrapper"},
                div {className:"icon-wrapper"}, i {className:"fa fa-"+icon}
                a {href:link}
              ) else null
      ) else div {className:"loading"}, "loading"

module.exports = ProjectViewComponent

