import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { toast } from 'react-toastify';
import { MdAdd, MdUpdate, MdDeleteForever } from 'react-icons/md';
import { FaTag } from 'react-icons/fa';

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

  async function handlePromotion(id, promo_activated) {
    await api
      .put(`/merchant/${id}`, {
        promo_activated,
      })
      .then(() => {
        if (promo_activated) {
          toast.success('Produto adicionado a lista de promoções!');
        } else {
          toast.success('Produto retirado da lista de promoções!');
        }
      })
      .catch(() => {
        toast.error(
          'Não foi possível adicionar este produto a lista de promoções'
        );
      });

    loadProducts();
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
          <li>Nome do produto</li>
          <li>Tipo de produto</li>
          <li>Preço</li>
          <div />
        </HeaderList>
        {loading ? (
          <h2>Carregando produtos...</h2>
        ) : (
          products.map(product => (
            <Product key={product.id}>
              <p>{product.name}</p>
              <p>{product.Type.name}</p>
              <p>
                ${' '}
                {product.promo_activated ? product.promo_price : product.price}
              </p>
              <div>
                {product.promo_activated ? (
                  <FaTag
                    onClick={() =>
                      handlePromotion(product.id, !product.promo_activated)
                    }
                    size={20}
                    color="#FFD700"
                  />
                ) : (
                  <FaTag
                    onClick={() =>
                      handlePromotion(product.id, !product.promo_activated)
                    }
                    size={20}
                    color="#000"
                  />
                )}

                <Link to={{ pathname: '/update', state: product }}>
                  <MdUpdate size={24} color="#000" />
                </Link>
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
