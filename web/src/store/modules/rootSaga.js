import { all } from 'redux-saga/effects';

import auth from './auth/sagas';
<<<<<<< HEAD
import user from './user/sagas';

export default function* rootSaga() {
  return yield all([auth, user]);
=======

export default function* rootSaga() {
  return yield all([auth]);
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
}
