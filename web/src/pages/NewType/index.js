import React from 'react';
import { Form, Input } from '@rocketseat/unform';
import * as Yup from 'yup';
import { toast } from 'react-toastify';

import api from '~/services/api';

import { Container } from './styles';

const schema = Yup.object().shape({
  name: Yup.string('O campo deve conter um texto').required(
    'O campo nome é requerido'
  ),
});

export default function NewType() {
  function handleSubmit({ name }) {
    api
      .post('/types', { name })
      .then(() => {
        toast.success('Tipo adicionado com sucesso!');
      })
      .catch(() => {
        toast.error('Não foi possível adicionar este tipo');
      });
  }

  return (
    <Container>
      <h1>Adicionar tipos</h1>
      <hr />
      <Form onSubmit={handleSubmit} schema={schema}>
        <Input type="text" name="name" placeholder="Nome do tipo de produto" />
        <button type="submit">Criar tipo de produto</button>
      </Form>
    </Container>
  );
}
