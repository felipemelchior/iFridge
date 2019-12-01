export function signInRequest(email, password) {
  return {
    type: '@auth/SIGN_IN_REQUEST',
    payload: { email, password },
  };
}

export function signInSuccess(token, user) {
  return {
    type: '@auth/SIGN_IN_SUCCESS',
    payload: { token, user },
  };
}

<<<<<<< HEAD
export function signUpRequest(name, email, password) {
  return {
    type: '@auth/SIGN_UP_REQUEST',
    payload: { name, email, password },
  };
}

=======
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
export function signFailure() {
  return {
    type: '@auth/SIGN_FAILURE',
  };
}
<<<<<<< HEAD

export function signOut() {
  return {
    type: '@auth/SIGN_OUT',
  };
}
=======
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
