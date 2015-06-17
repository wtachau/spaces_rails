# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.

#= require jquery
#= require jquery-textcomplete
#= require bootstrap-sprockets
#= require jquery_ujs
#= require jquery.remotipart
#= require bootstrap-select
#= require turbolinks
#= require selectize
#= require react
#= require react_ujs
#= require react_router
#= require react_router_ujs
#= require components
#= require_self
#= require_tree ./
#= require_tree ./core/

@Spaces = {}

# Route = ReactRouter.Route
# RouteHandler = ReactRouter.RouteHandler

# App = React.createClass
# 	render: ->
# 		`<div>
# 			<ApplicationComponent/>
# 			<RouteHandler/>
# 		</div>`

# @routes = (
#     `<Route handler={ApplicationComponent}>
# 		<Route name='create' handler={ProjectCreateComponent} path='create' />
# 		<Route name='feed' handler={MainFeedComponent} path='/' />
#     </Route>`
#   )

# ReactRouter.run(routes, (Handler) ->
#   React.render <Handler/>, document.body
# )