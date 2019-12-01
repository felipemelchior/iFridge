import React from 'react';
<<<<<<< HEAD
import { useDispatch } from 'react-redux';
=======
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
import { Link } from 'react-router-dom';
import { Form, Input } from '@rocketseat/unform';
import * as Yup from 'yup';

import logo from '~/assets/logo.svg';

import { Image } from '~/pages/_layouts/auth/styles';

<<<<<<< HEAD
import { signUpRequest } from '~/store/modules/auth/actions';

=======
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
const schema = Yup.object().shape({
  name: Yup.string().required('O nome é obrigatório'),
  email: Yup.string()
    .email('Insira um e-mail válido')
    .required('O e-mail é obrigatório'),
  password: Yup.string()
    .min(6, 'No mínimo 6 caracteres')
    .required('O nome é obrigatório'),
});

export default function SignUp() {
<<<<<<< HEAD
  const dispatch = useDispatch();

  function handleSubmit({ name, email, password }) {
    dispatch(signUpRequest(name, email, password));
=======
  function handleSubmit(data) {
    console.tron.log(data);
>>>>>>> b301c18eed188e88a872075c7fde9ae423bb7874
  }

  return (
    <>
      <Image src={logo} alt="iFridge" />
      <p>iFridge</p>

      <Form schema={schema} onSubmit={handleSubmit}>
        <Input name="name" type="text" placeholder="Nome Completo" />
        <Input name="email" type="email" placeholder="Seu email" />
        <Input
          name="password"
          type="password"
          placeholder="Sua senha secreta"
        />

        <button type="submit">Criar conta</button>

        <Link to="/">Já possui cadastro?</Link>
      </Form>
    </>
  );
}
