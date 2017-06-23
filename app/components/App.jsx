// container for pages

import React from 'react';
import PropTypes from 'prop-types';

const App = ({ children }) => (
  <div className="page">
    <div>{children}</div>
  </div>
);

App.propTypes = {
  children: PropTypes.element.isRequired,
};

export default App;

