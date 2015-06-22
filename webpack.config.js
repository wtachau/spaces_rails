module.exports = {
  cache: true,
  entry: "./client/index",
  output: {
    path: './public',
    filename: 'bundle.js'
  },
  resolve: {
    extensions: ["", ".jsx", ".cjsx", ".coffee", ".js"],
    modulesDirectories: ["js", "node_modules"]
  },
  module: {
    loaders: [
      { test: /\.scss$/, loaders: ['style', 'css', 'sass-loader'] },
      { test: /\.coffee$/, loader: "coffee-loader"},
      { test: /\.(png|woff|woff2|eot|ttf|svg)$/, loader: 'url-loader?limit=100000' }
    ]
  },
  plugins: []
};