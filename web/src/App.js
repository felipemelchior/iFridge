import React from 'react';
<<<<<<< HEAD
import { ToastContainer } from 'react-toastify';
import { PersistGate } from 'redux-persist/integration/react';
=======
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
import { Provider } from 'react-redux';
import { Router } from 'react-router-dom';

import '~/config/ReactotronConfig';

import Routes from '~/routes';
import history from '~/services/history';

<<<<<<< HEAD
import { store, persistor } from '~/store';
=======
import store from '~/store';
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874

import GlobalStyle from '~/styles/global';

function App() {
  return (
    <Provider store={store}>
<<<<<<< HEAD
      <PersistGate persistor={persistor}>
        <Router history={history}>
          <Routes />
          <GlobalStyle />
          <ToastContainer autoClose={3000} />
        </Router>
      </PersistGate>
=======
      <Router history={history}>
        <Routes />
        <GlobalStyle />
      </Router>
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
    </Provider>
  );
}

export default App;
