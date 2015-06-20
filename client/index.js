// Generated by CoffeeScript 1.9.3
var AppComponent, DefaultRoute, HeaderComponent, MainFeedComponent, ProjectCreateComponent, ProjectViewComponent, React, Reqwest, Route, RouteHandler, Router, a, div, h1, p, ref, routes, test;

require('./assets/stylesheets/main.scss');

require('./assets/stylesheets/header.scss');

require('./assets/stylesheets/create.scss');

require('./assets/stylesheets/sidebar.scss');

require('./assets/stylesheets/feed.scss');

require('./assets/stylesheets/users.scss');

require('./assets/stylesheets/project.scss');

React = require("react");

Reqwest = require("reqwest");

Router = require('react-router');

RouteHandler = Router.RouteHandler;

HeaderComponent = require("./components/header/HeaderComponent");

ref = React.DOM, div = ref.div, h1 = ref.h1, p = ref.p, a = ref.a;

AppComponent = React.createClass({
  getInitialState: function() {
    return {
      user: null,
      page: 'feed',
      selectedProject: null
    };
  },
  componentWillMount: function() {
    return this.readFromAPI(this.props.origin + '/user', (function(_this) {
      return function(data) {
        return _this.setState({
          user: data
        });
      };
    })(this));
  },
  getDefaultProps: function() {
    return {
      origin: process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : ''
    };
  },
  readFromAPI: function(url, success) {
    return Reqwest({
      url: url,
      type: 'json',
      method: 'get',
      contentType: 'application/json',
      success: success,
      error: function(error) {
        return console.log(url, error['response']);
      }
    });
  },
  render: function() {
    return div({
      "id": "content"
    }, React.createElement(HeaderComponent, {
      homeClicked: this.homeClicked,
      createClicked: this.createClicked,
      user: this.state.user
    }), React.createElement(RouteHandler, {
      origin: this.props.origin,
      readFromAPI: this.readFromAPI
    }));
  }
});

DefaultRoute = Router.DefaultRoute;

Route = Router.Route;

MainFeedComponent = require('./components/feed/MainFeedComponent');

ProjectCreateComponent = require('./components/project/ProjectCreateComponent');

ProjectViewComponent = require('./components/project/ProjectViewComponent');

test = React.createElement(ProjectViewComponent);

console.log(test);

routes = React.createElement(Route, {
  name: "App",
  path: "/",
  handler: AppComponent
}, React.createElement(Route, {
  name: "home",
  path: "/",
  handler: MainFeedComponent
}), React.createElement(Route, {
  name: "create",
  path: "/create",
  handler: ProjectCreateComponent
}), React.createElement(Route, {
  name: "projectview",
  path: "project/:id",
  handler: ProjectViewComponent
}));

Router.run(routes, Router.HistoryLocation, function(Handler) {
  console.log(Handler);
  return React.render(React.createElement(Handler), document.body);
});
