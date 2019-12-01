import React from 'react';
import { useSelector } from 'react-redux';
import { Link } from 'react-router-dom';

import { Container, Content, Logo, Profile } from './styles';

import logo from '~/assets/logo.svg';

export default function Header() {
  const profile = useSelector(state => state.user.profile);

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
              <strong>{profile.name}</strong>
              <Link to="/profile">Meu perfil</Link>
            </div>
            <img
              src={`https://api.adorable.io/avatars/50/${profile.name}.png`}
              alt={profile.name}
            />
          </Profile>
        </aside>
      </Content>
    </Container>
  );
}
