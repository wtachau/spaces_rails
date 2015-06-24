React = require "react"
Router = require 'react-router'
Link = Router.Link

{ div, span, img, a, i } = React.DOM

ProjectComponent = React.createClass

  render: ->
    tag_list = @props.project.tag_list.map (tag) ->
      span {key:tag}, tag,

    div {className:"feed-post"},
      div {className:"row"},
        div {className:"profile-container username-link", "user-id":@props.user.id},
          img {className:"profilepic-small", src:@props.user.image}
          div {className:"profile-text-wrapper"},
            div {className:"username"}, @props.user.first_name+" "+@props.user.last_name
            div {className:"timestamp"}, @props.project.time_ago+" ago"
        div {className:"feed-links"},
          if @props.project.github then a {href:@props.project.github}, i {className:"fa fa-github fa-3x"} else null
          if @props.project.dropbox then a {href:@props.project.dropbox}, i {className:"fa fa-dropbox fa-3x"} else null
      div {className:"row"},
        div {className:"project-title"}, @props.project.name
        div {className:"row"},
          div {className:"project-desc-label"}, "Problem:"
          div {className:"project-desc"}, @props.project.problem
        div {className:"row"},
          div {className:"project-desc-label"}, "Solution:"
          div {className:"project-desc"}, @props.project.problem
        React.createElement Link, {to:"/project/"+@props.project.id, className:"project-details-link"}, "Details"
        div {className:"project-footer"},
          div {className:"feedback"},
            "Feedback: ", a {href:"/comments"}, span {className:"feedback-number"}, @props.project.numComments
          div {className:"tags"}, "Tags: ", span {className:"tags-text"}, tag_list
      div {className:"feed-separator"}

module.exports = ProjectComponent