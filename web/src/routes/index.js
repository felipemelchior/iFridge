import React from 'react';
import { Switch } from 'react-router-dom';
import Route from './Route';

import SignIn from '~/pages/SignIn';
import SignUp from '~/pages/SignUp';

import Dashboard from '~/pages/Dashboard';
import Profile from '~/pages/Profile';

import NewProduct from '~/pages/NewProduct';
import NewType from '~/pages/NewType';

export default function Routes() {
  return (
    <Switch>
      <Route path="/" exact component={SignIn} />
      <Route path="/register" component={SignUp} />

      <Route path="/dashboard" component={Dashboard} isPrivate />
      <Route path="/profile" component={Profile} isPrivate />

      <Route path="/product" component={NewProduct} isPrivate />
      <Route path="/type" component={NewType} isPrivate />

      <Route path="/" component={() => <h1>404</h1>} />
    </Switch>
  );
}
