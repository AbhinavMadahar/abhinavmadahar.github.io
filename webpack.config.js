module.exports = {
  devtool: 'inline-eval-cheap-source-map',
  entry: `${__dirname}/app/main.jsx`,
  output: {
    path: 'dist',
    filename: 'bundle.js',
    publicPath: '/media/',
  },
  module: {
    loaders: [
      {
        test: /\.jsx?/,
        loader: 'babel',
        exclude: /node_modules/,
      },
      {
        test: /\.scss$/,
        loaders: ['style', 'css', 'sass'],
      },
      {
        test: /\.json$/,
        loader: 'json-loader',
      },
    ],
  },
};
