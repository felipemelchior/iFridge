import React from 'react';
import { Form, Input } from '@rocketseat/unform';
import * as Yup from 'yup';
import { toast } from 'react-toastify';

import api from '~/services/api';
import history from '~/services/history';

import { Container } from './styles';

const schema = Yup.object().shape({
  name: Yup.string('Field must contain text').required(
    'Name field is required'
  ),
});

export default function NewType() {
  function handleSubmit({ name }) {
    api
      .post('/types', { name })
      .then(() => {
        toast.success('Type successfully added!');
        history.push('/');
      })
      .catch(() => {
        toast.error('Could not add this type');
      });
  }

  return (
    <Container>
      <h1>Add types</h1>
      <hr />
      <Form onSubmit={handleSubmit} schema={schema}>
        <Input type="text" name="name" placeholder="Product Type Name" />
        <button type="submit">Create product type</button>
      </Form>
    </Container>
  );
}
