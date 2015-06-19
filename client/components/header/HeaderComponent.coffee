React = require "react"
{ div, img } = React.DOM

Router = require 'react-router'
Link = Router.Link

HeaderComponent = React.createClass

  render: ->
      div { "className":"navbar navbar-fixed-top" },
        div { "className":"container-fluid header"},
          div { "className":"logo"}, "Spaces"
          div { "className":"upper_right"}, 
            if @props.user
                img { "className":"profile", "src":@props.user.image+"?sz=100"}
          div { "className":"create-button"}, 
          	React.createElement Link, {to:"create"}, "create"
          div { "className":"header-links"},
          	React.createElement Link, {to:"/"}, "Home"

module.exports = HeaderComponent