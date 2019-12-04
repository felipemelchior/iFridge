import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
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

      // eslint-disable-next-line array-callback-return
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
      .put(`/merchant/${product.id}`, {
        name,
        type_id,
        price,
        promo_price,
      })
      .then(() => {
        toast.success('Product successfully changed!');
        history.push('/');
      })
      .catch(() => {
        toast.error('Unable to change this product');
      });
  }

  return (
    <Container>
      <h1>Change product</h1>
      <hr />

      <Form onSubmit={handleSubmit} initialData={product}>
        <Input type="text" name="name" placeholder="Product's name" />
        <Select name="type_id" placeholder="Select a type" options={types} />
        <div>
          <MdAttachMoney size={32} color="#000" />
          <Input
            type="number"
            step="0.01"
            name="price"
            placeholder="Price of the product"
          />
        </div>

        <div>
          <MdAttachMoney size={32} color="#000" />
          <Input
            type="number"
            step="0.01"
            name="promo_price"
            placeholder="Product promotional price"
          />
        </div>
        <button type="submit">Update product</button>
      </Form>
    </Container>
  );
}

UpdateProduct.propTypes = {
  location: PropTypes.shape({
    state: PropTypes.element,
  }).isRequired,
};
