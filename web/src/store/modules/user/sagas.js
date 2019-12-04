import { all, takeLatest, call, put } from 'redux-saga/effects';
import { toast } from 'react-toastify';

import api from '~/services/api';

import { updateProfileSuccess, updateProfileFailure } from './actions';

export function* updateProfile({ payload }) {
  try {
    const { name, email, address, ...rest } = payload.data;

    const profile = {
      name,
      email,
      address,
      ...(rest.oldPassword ? rest : {}),
    };

    const response = yield call(api.put, '/users', profile);
    toast.success('Profile updated successfully!');

    yield put(updateProfileSuccess(response.data));
  } catch (err) {
    toast.error('Error updating profile, check your details');
    yield put(updateProfileFailure());
  }
}

export default all([takeLatest('@user/UPDATE_PROFILE_REQUEST', updateProfile)]);
