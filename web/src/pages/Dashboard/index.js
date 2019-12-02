import React, { useEffect, useState } from 'react';
import { toast } from 'react-toastify';
import { MdAdd, MdUpdate, MdDeleteForever } from 'react-icons/md';

import api from '~/services/api';
import history from '~/services/history';

import { Container, ProductList, HeaderList, Product } from './styles';

export default function Dashboard() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(false);

  async function loadProducts() {
    setLoading(true);
    const response = await api.get('/merchant');

    setProducts(response.data);
    setLoading(false);
  }

  useEffect(() => {
    loadProducts();
  }, []);

  function handleNewType() {
    history.push('/type');
  }
  function handleNewProduct() {
    history.push('/product');
  }

  function handleUpdate(id) {
    console.log('click');
  }

  async function handleDelete(id) {
    const response = await api.delete(`/merchant/${id}`);

    if (response.data) {
      toast.success('Produto excluido com sucesso!');
      loadProducts();
    } else {
      toast.error('Não foi possível excluir este produto!');
      loadProducts();
    }
  }

  return (
    <Container>
      <div>
        <button type="button" onClick={handleNewType}>
          <MdAdd size={36} color="#d1191d" />
          <span>Adicionar Tipo de alimento</span>
        </button>

        <button type="button" onClick={handleNewProduct}>
          <MdAdd size={36} color="#d1191d" />
          <span>Adicionar Tipo novo produto</span>
        </button>
      </div>

      <ProductList>
        <HeaderList>
          <p>Nome do produto</p>
          <p>Preço</p>
          <div />
        </HeaderList>
        {loading ? (
          <h2>Carregando produtos...</h2>
        ) : (
          products.map(product => (
            <Product key={product.id}>
              <p>{product.name}</p>
              <p>R$ {product.price}</p>
              <div>
                <MdUpdate
                  onClick={() => handleUpdate(product.id)}
                  size={24}
                  color="#000"
                />
                <MdDeleteForever
                  onClick={() => handleDelete(product.id)}
                  size={24}
                  color="#000"
                />
              </div>
            </Product>
          ))
        )}
      </ProductList>
    </Container>
  );
}
