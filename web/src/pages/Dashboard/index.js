import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { toast } from 'react-toastify';
import { MdAdd, MdUpdate, MdDeleteForever } from 'react-icons/md';
import { FaTags } from 'react-icons/fa';

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
      toast.success('Product successfully removed!');
      loadProducts();
    } else {
      toast.error('Unable to delete this product!');
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
          toast.success('Product added to promotion list!');
        } else {
          toast.success('Product removed from promotion list!');
        }
      })
      .catch(() => {
        toast.error('Unable to add this product to promotion list');
      });

    loadProducts();
  }

  return (
    <Container>
      <div>
        <button type="button" onClick={handleNewType}>
          <MdAdd size={36} color="#d1191d" />
          <br />
          <span>Add Product Type</span>
        </button>

        <button type="button" onClick={handleNewProduct}>
          <MdAdd size={36} color="#d1191d" />
          <br />
          <span>Add New Product</span>
        </button>
      </div>

      <ProductList>
        <HeaderList>
          <li>Product name</li>
          <li>Product type</li>
          <li>Price</li>
          <div />
        </HeaderList>
        {loading ? (
          <h2>Loading products ...</h2>
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
                  <FaTags
                    onClick={() =>
                      handlePromotion(product.id, !product.promo_activated)
                    }
                    size={20}
                    color="#FFD700"
                  />
                ) : (
                  <FaTags
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
