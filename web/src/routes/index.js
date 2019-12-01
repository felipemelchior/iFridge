import React from 'react';
import { Switch } from 'react-router-dom';
import Route from './Route';

import SignIn from '~/pages/SignIn';
import SignUp from '~/pages/SignUp';

import Dashboard from '~/pages/Dashboard';
import Profile from '~/pages/Profile';

<<<<<<< HEAD
import NewProduct from '~/pages/NewProduct';
import NewType from '~/pages/NewType';

=======
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
export default function Routes() {
  return (
    <Switch>
      <Route path="/" exact component={SignIn} />
      <Route path="/register" component={SignUp} />

      <Route path="/dashboard" component={Dashboard} isPrivate />
      <Route path="/profile" component={Profile} isPrivate />

<<<<<<< HEAD
      <Route path="/product" component={NewProduct} isPrivate />
      <Route path="/type" component={NewType} isPrivate />
=======
      <Route path="/" component={() => <h1>404</h1>} />
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
    </Switch>
  );
}
