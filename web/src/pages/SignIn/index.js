import React from 'react';
import { Link } from 'react-router-dom';

import logo from '~/assets/logo.svg';

import { Image } from '~/pages/_layouts/auth/styles';

export default function SignIn() {
  return (
    <>
      <Image src={logo} alt="iFridge" />
      <p>iFridge</p>

      <form>
        <input type="email" placeholder="Seu email" />
        <input type="password" placeholder="Sua senha secreta" />

        <button type="submit">Acessar</button>

        <Link to="/register">Criar conta gratuita</Link>
      </form>
    </>
  );
}
