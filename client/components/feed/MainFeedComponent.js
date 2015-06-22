// Generated by CoffeeScript 1.9.3
var MainFeedComponent, MainSidebarComponent, ProjectComponent, React, div;

React = require("react");

ProjectComponent = require("../project/ProjectComponent");

div = React.DOM.div;

MainSidebarComponent = React.createClass({
  render: function() {
    return div({
      className: "sidebar sidebar-main"
    }, div({
      className: "sidebar-header"
    }, "most recent activity"));
  }
});

MainFeedComponent = React.createClass({
  getInitialState: function() {
    return {
      projects: []
    };
  },
  componentWillMount: function() {
    return this.loadProjectsFromServer();
  },
  componentDidMount: function() {
    return this.pollServer();
  },
  loadProjectsFromServer: function() {
    return this.props.readFromAPI(this.props.origin + '/projects', (function(_this) {
      return function(data) {
        return _this.setState({
          projects: data.projects
        });
      };
    })(this));
  },
  pollServer: function() {},
  render: function() {
    var projectNodes;
    projectNodes = this.state.projects.map((function(_this) {
      return function(data) {
        return React.createElement(ProjectComponent, {
          user: data.user,
          project: data,
          key: data.id
        });
      };
    })(this));
    return div({
      className: "body_area"
    }, div({
      className: "main-panel main-panel-feed"
    }, div({
      className: "feed-posts"
    }, projectNodes)), React.createElement(MainSidebarComponent));
  }
});

module.exports = MainFeedComponent;