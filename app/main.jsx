import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import firebase from 'firebase';

import App from './components/App.jsx';
import Home from './components/Home.jsx';

// set up routing
ReactDOM.render((
    <Router history={browserHistory}>
        <Route path="/" component={App}>
            <IndexRoute component={Home} />
        </Route>
    </Router>
), document.getElementById('container'));

browserHistory.listen(() => window.scrollTo(0, 0));

