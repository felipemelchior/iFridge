import React from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Form, Input } from '@rocketseat/unform';

import { signOut } from '~/store/modules/auth/actions';
import { updateProfileRequest } from '~/store/modules/user/actions';

import { Container, Avatar } from './styles';

export default function Profile() {
  const dispatch = useDispatch();
  const profile = useSelector(state => state.user.profile);

  function handleSubmit(data) {
    dispatch(updateProfileRequest(data));
  }

  function handleSignOut() {
    dispatch(signOut());
  }

  return (
    <Container>
      <Avatar>
        <img
          src={`https://api.adorable.io/avatars/250/${profile.name}.png`}
          alt={profile.name}
        />
      </Avatar>

      <Form initialData={profile} onSubmit={handleSubmit}>
        <Input name="name" placeholder="Full name" />
        <Input name="email" type="email" placeholder="Your e-mail address" />
        <Input name="address" placeholder="Business address" />
        <Input name="cep" placeholder="ZIP Code" />

        <hr />

        <Input
          name="oldPassword"
          type="password"
          placeholder="Your current password"
        />
        <Input name="password" type="password" placeholder="New password" />
        <Input
          name="confirmPassword"
          type="password"
          placeholder="Password Confirmation"
        />

        <button type="submit">Update Profile</button>
      </Form>

      <button type="button" onClick={handleSignOut}>
        Exit iFridge
      </button>
    </Container>
  );
}
