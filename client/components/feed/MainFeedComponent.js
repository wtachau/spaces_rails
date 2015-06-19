// Generated by CoffeeScript 1.9.3
var MainFeedComponent, React, div;

React = require("react");

div = React.DOM.div;

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
        return div({}, "hello");
      };
    })(this));
    return div({
      className: "body_area"
    }, div({
      className: "main-panel main-panel-feed"
    }, div({
      className: "feed-posts"
    }, projectNodes)), div({}, "sidebar"));
  }
});

module.exports = MainFeedComponent;
