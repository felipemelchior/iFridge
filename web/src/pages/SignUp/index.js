import React from 'react';
import { Link } from 'react-router-dom';

import logo from '~/assets/logo.svg';

import { Image } from '~/pages/_layouts/auth/styles';

export default function SignUp() {
  return (
    <>
      <Image src={logo} alt="iFridge" />
      <p>iFridge</p>

      <form>
        <input type="text" placeholder="Nome Completo" />
        <input type="email" placeholder="Seu email" />
        <input type="password" placeholder="Sua senha secreta" />

        <button type="submit">Criar conta</button>

        <Link to="/">Já possui cadastro?</Link>
      </form>
    </>
  );
}
