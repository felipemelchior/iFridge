import React from 'react';
import { useDispatch } from 'react-redux';
import { Link } from 'react-router-dom';
import { Form, Input } from '@rocketseat/unform';
import * as Yup from 'yup';

import logo from '~/assets/logo.svg';

import { Image } from '~/pages/_layouts/auth/styles';

import { signUpRequest } from '~/store/modules/auth/actions';

const schema = Yup.object().shape({
  name: Yup.string().required('Name is required'),
  email: Yup.string()
    .email('Enter a valid email')
    .required('Email is required'),
  address: Yup.string().required('Address is required'),
  cep: Yup.string().required('ZIP field is required'),
  password: Yup.string()
    .min(6, '6 characters minimum')
    .required('Name is required'),
});

export default function SignUp() {
  const dispatch = useDispatch();

  function handleSubmit({ name, email, address, cep, password }) {
    dispatch(signUpRequest(name, email, address, cep, password));
  }

  return (
    <>
      <Image src={logo} alt="iFridge" />
      <p>iFridge</p>

      <Form schema={schema} onSubmit={handleSubmit}>
        <Input name="name" type="text" placeholder="Full name" />
        <Input name="email" type="email" placeholder="Your email" />
        <div>
          <Input name="address" type="text" placeholder="Business address" />
          <Input name="cep" type="text" placeholder="Your zip code" />
        </div>
        <Input
          name="password"
          type="password"
          placeholder="Your secret password"
        />

        <button type="submit">Create an account</button>

        <Link to="/">Already registered?</Link>
      </Form>
    </>
  );
}
