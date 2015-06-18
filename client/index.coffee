# require 'bootstrap-sass-loader'
require './assets/stylesheets/main.scss'
require './assets/stylesheets/header.scss'

React = require("react")
Reqwest = require("reqwest")
HomeComponent = require("./components/HomeComponent")

{ div, h1, p, a} = React.DOM

AppComponent = React.createClass
	
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
			React.createElement(HomeComponent, 
				{origin:@props.origin, readFromAPI:@readFromAPI} )

React.render (React.createElement AppComponent), document.body