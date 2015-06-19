# require 'bootstrap-sass-loader'
require './assets/stylesheets/main.scss'
require './assets/stylesheets/header.scss'
require './assets/stylesheets/create.scss'
require './assets/stylesheets/sidebar.scss'

React = require "react"
Reqwest = require "reqwest"
Router = require 'react-router'
RouteHandler = Router.RouteHandler
HeaderComponent = require "./components/header/HeaderComponent"

{ div, h1, p, a} = React.DOM

AppComponent = React.createClass

  getInitialState: ->
    { user: null, page: 'feed', selectedProject: null }

  componentWillMount: ->
    @readFromAPI @props.origin + '/user', (data) =>
      @setState(user: data)
  
  getDefaultProps: ->
    { origin: if process.env.NODE_ENV == 'development' then 'http://localhost:3000' else '' }

  readFromAPI: (url, success) ->
    Reqwest {
      url: url,
      type: 'json',
      method: 'get',
      contentType: 'application/json',
      success: success,
      error: (error) ->
        console.log url, error['response']
    }
  render: ->
    div {"id":"content"}, 
      ( React.createElement HeaderComponent, {@homeClicked, @createClicked, user: @state.user} )
      React.createElement RouteHandler, {origin:@props.origin, readFromAPI:@readFromAPI}

DefaultRoute = Router.DefaultRoute
Route = Router.Route

MainFeedComponent = require './components/feed/MainFeedComponent'
ProjectCreateComponent = require './components/project/ProjectCreateComponent'

routes = React.createElement Route, {name:"App", path:"/", handler:AppComponent},
          (React.createElement Route, {name:"home", path:"/", handler:MainFeedComponent}),
          (React.createElement Route, {name:"create", path: "create", handler:ProjectCreateComponent})
        
# Get the route handler based on HistoryLocation, and execute callback
Router.run routes, Router.HistoryLocation, (Handler) ->
  React.render (React.createElement Handler), document.body