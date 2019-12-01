import React from 'react';
import PropTypes from 'prop-types';
<<<<<<< HEAD

import { Wrapper } from './styles';

import Header from '~/components/Header';

export default function DefaultLayout({ children }) {
  return (
    <Wrapper>
      <Header />
      {children}
    </Wrapper>
  );
=======
import { Wrapper } from './styles';

export default function DefaultLayout({ children }) {
  return <Wrapper>{children}</Wrapper>;
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
}

DefaultLayout.propTypes = {
  children: PropTypes.element.isRequired,
};
