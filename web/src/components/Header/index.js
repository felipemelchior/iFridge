import React from 'react';
import { Link } from 'react-router-dom';

import { Container, Content, Logo, Profile } from './styles';

import logo from '~/assets/logo.svg';

export default function Header() {
  return (
    <Container>
      <Content>
        <nav>
          <Logo src={logo} alt="iFridge" />
          <Link to="/dashboard">DASHBOARD</Link>
        </nav>

        <aside>
          <Profile>
            <div>
              <strong>Felipe Melchior</strong>
              <Link to="/profile">Meu perfil</Link>
            </div>
            <img
              src="https://api.adorable.io/avatars/50/ifridge.png"
              alt="Perfil"
            />
          </Profile>
        </aside>
      </Content>
    </Container>
  );
}
