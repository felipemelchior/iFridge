<<<<<<< HEAD
import { persistStore } from 'redux-persist';
import createSagaMiddleware from 'redux-saga';

import createStore from './createStore';
import persistReducers from './persistReducers';
=======
import createSagaMiddleware from 'redux-saga';
import createStore from './createStore';
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874

import rootReducer from './modules/rootReducer';
import rootSaga from './modules/rootSaga';

const sagaMonitor =
  process.env.NODE_ENV === 'development'
    ? console.tron.createSagaMonitor()
    : null;
const sagaMiddleware = createSagaMiddleware({ sagaMonitor });

const middlewares = [sagaMiddleware];

<<<<<<< HEAD
const store = createStore(persistReducers(rootReducer), middlewares);
const persistor = persistStore(store);

sagaMiddleware.run(rootSaga);

export { store, persistor };
=======
const store = createStore(rootReducer, middlewares);

sagaMiddleware.run(rootSaga);

export default store;
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
