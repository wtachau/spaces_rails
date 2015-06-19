React = require "react"
{ div, img } = React.DOM

Router = require 'react-router'
Link = Router.Link

HeaderComponent = React.createClass

  render: ->
      div { "className":"navbar navbar-fixed-top" },
        div { "className":"container-fluid header"},
          div { "className":"logo"}, "Spaces"
          React.createElement Link, {to:"create"}, "create"
          div { "id":"add_profile", "className":"upper_right"}, 
            if @props.user
                img { "className":"profile", "src":@props.user.image+"?sz=100"}
          div { "onClick": @props.createClicked, "className":"create-button"}, "Create"
          div { "className":"header-links"},

module.exports = HeaderComponent