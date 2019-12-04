import React from 'react';
import { useDispatch } from 'react-redux';
import { Link } from 'react-router-dom';
import { Form, Input } from '@rocketseat/unform';
import * as Yup from 'yup';

import { signInRequest } from '~/store/modules/auth/actions';

import logo from '~/assets/logo.svg';

import { Image } from '~/pages/_layouts/auth/styles';

const schema = Yup.object().shape({
  email: Yup.string()
    .email('Enter a valid email')
    .required('Email is required'),
  password: Yup.string().required('Password is required'),
});

export default function SignIn() {
  const dispatch = useDispatch();

  function handleSubmit({ email, password }) {
    dispatch(signInRequest(email, password));
  }

  return (
    <>
      <Image src={logo} alt="iFridge" />
      <p>iFridge</p>

      <Form schema={schema} onSubmit={handleSubmit}>
        <Input type="email" name="email" placeholder="Your email" />
        <Input
          type="password"
          name="password"
          placeholder="Your secret password"
        />

        <button type="submit">Access</button>

        <Link to="/register">Create free account</Link>
      </Form>
    </>
  );
}
