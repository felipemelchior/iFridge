import React, { useState, useEffect } from 'react';
import { Form, Input, Select } from '@rocketseat/unform';
import { MdAttachMoney } from 'react-icons/md';
import { toast } from 'react-toastify';
import * as Yup from 'yup';

import { Container } from './styles';

import api from '~/services/api';

const schema = Yup.object().shape({
  name: Yup.string('O campo deve conter um texto').required(
    'Campo Nome é requerido'
  ),
  type: Yup.number('Selecione um tipo válido').required(
    'Campo Tipo é requerido'
  ),
  price: Yup.number('Insira um preço válido').required(
    'Campo Preço é requerido'
  ),
});

export default function NewProduct() {
  const [types, setTypes] = useState([]);

  useEffect(() => {
    async function loadTypes() {
      const response = await api.get('/types');

      response.data.map(type => {
        type.title = type.name;
        delete type.name;
        delete type.createdAt;
        delete type.updatedAt;
      });

      setTypes(response.data);
    }

    loadTypes();
  }, []);

  function handleSubmit({ name, type_id, price }) {
    api
      .post('/merchant', {
        name,
        type_id,
        price,
      })
      .then(() => {
        toast.success('Produto adicionado com sucesso!');
      })
      .catch(() => {
        toast.error('Não foi possível adicionar este produto');
      });
  }

  return (
    <Container>
      <h1>Adicionar novo produto</h1>
      <hr />

      <Form onSubmit={handleSubmit}>
        <Input type="text" name="name" placeholder="Nome do produto" />
        <Select
          name="type_id"
          placeholder="Selecione um tipo"
          options={types}
        />
        <div>
          <MdAttachMoney size={32} color="#000" />
          <Input
            type="number"
            step="0.01"
            name="price"
            placeholder="Preço do produto"
          />
        </div>
        <button type="submit">Criar novo produto</button>
      </Form>
    </Container>
  );
}
