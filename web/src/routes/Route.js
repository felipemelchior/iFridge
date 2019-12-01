import React from 'react';
<<<<<<< HEAD
import { Route, Redirect } from 'react-router-dom';
import PropTypes from 'prop-types';
=======
import PropTypes from 'prop-types';
import { Route, Redirect } from 'react-router-dom';
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874

import AuthLayout from '~/pages/_layouts/auth';
import DefaultLayout from '~/pages/_layouts/default';

<<<<<<< HEAD
import { store } from '~/store';

=======
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
export default function RouteWrapper({
  component: Component,
  isPrivate,
  ...rest
}) {
<<<<<<< HEAD
  const { signed } = store.getState().auth;
=======
  const signed = false;
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874

  if (!signed && isPrivate) {
    return <Redirect to="/" />;
  }

  if (signed && !isPrivate) {
    return <Redirect to="/dashboard" />;
  }

  const Layout = signed ? DefaultLayout : AuthLayout;

  return (
    <Route
      {...rest}
      render={props => (
        <Layout>
          <Component {...props} />
        </Layout>
      )}
    />
  );
}

RouteWrapper.propTypes = {
  isPrivate: PropTypes.bool,
  component: PropTypes.oneOfType([PropTypes.element, PropTypes.func])
    .isRequired,
};

RouteWrapper.defaultProps = {
  isPrivate: false,
};
