import React from 'react';
import { Link } from 'react-router-dom';
import { Form, Input } from '@rocketseat/unform';

import * as Yup from 'yup';

import logo from '~/assets/logo.svg';

import { Image } from '~/pages/_layouts/auth/styles';

const schema = Yup.object().shape({
  email: Yup.string()
    .email('Insira um e-mail válido')
    .required('O e-mail é obrigatório'),
  password: Yup.string().required('A senha é obrigatória'),
});

export default function SignIn() {
  function handleSubmit(data) {
    console.tron.log(data);
  }

  return (
    <>
      <Image src={logo} alt="iFridge" />
      <p>iFridge</p>

      <Form schema={schema} onSubmit={handleSubmit}>
        <Input type="email" name="email" placeholder="Seu email" />
        <Input
          type="password"
          name="password"
          placeholder="Sua senha secreta"
        />

        <button type="submit">Acessar</button>

        <Link to="/register">Criar conta gratuita</Link>
      </Form>
    </>
  );
}
