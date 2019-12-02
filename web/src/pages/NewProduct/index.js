import React, { useState, useEffect } from 'react';
import { Form, Input, Select } from '@rocketseat/unform';
import { MdAttachMoney } from 'react-icons/md';
import { toast } from 'react-toastify';

import { Container } from './styles';

import api from '~/services/api';
import history from '~/services/history';

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

  function handleSubmit({ name, type_id, price, promo_price }) {
    api
      .post('/merchant', {
        name,
        type_id,
        price,
        promo_price,
      })
      .then(() => {
        toast.success('Produto adicionado com sucesso!');
        history.push('/');
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

        <div>
          <MdAttachMoney size={32} color="#000" />
          <Input
            type="number"
            step="0.01"
            name="promo_price"
            placeholder="Preço em promoção"
          />
        </div>
        <button type="submit">Criar novo produto</button>
      </Form>
    </Container>
  );
}
