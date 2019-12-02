import React, { useState, useEffect } from 'react';
import { Form, Input, Select } from '@rocketseat/unform';
import { MdAttachMoney } from 'react-icons/md';
import { toast } from 'react-toastify';

import { Container } from './styles';

import api from '~/services/api';
import history from '~/services/history';

export default function UpdateProduct({ location }) {
  const [types, setTypes] = useState([]);
  const { state: product } = location;

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
      .put(`/merchant/${product.id}`, {
        name,
        type_id,
        price,
      })
      .then(() => {
        toast.success('Produto alterado com sucesso!');
        history.push('/');
      })
      .catch(() => {
        toast.error('Não foi possível alterar este produto');
      });
  }

  return (
    <Container>
      <h1>Alterar produto</h1>
      <hr />

      <Form onSubmit={handleSubmit} initialData={product}>
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
        <button type="submit">Alterar produto</button>
      </Form>
    </Container>
  );
}
