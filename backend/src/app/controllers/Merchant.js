import * as Yup from 'yup';

import Products from '../models/Products';
import Types from '../models/Types';

class Merchant {
  async index(req, res) {
    const products = await Products.findAll({
      where: { owner_id: req.userId },
    });

    return res.json(products);
  }

  async store(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string().required(),
      type_id: Yup.number().required(),
      price: Yup.string().required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation Fails' });
    }

    const { name, type_id, price } = req.body;

    const productExists = await Products.findOne({
      where: { name, owner_id: req.userId },
    });

    if (productExists) {
      return res.status(401).json({ error: 'Product already exist' });
    }

    const typeExists = await Types.findByPk(type_id);

    if (!typeExists) {
      return res.status(401).json({ error: 'Type does not exist' });
    }

    const newProduct = await Products.create({
      name,
      type_id,
      price,
      owner_id: req.userId,
    });
    return res.status(200).json(newProduct);
  }

  async update(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string(),
      type_id: Yup.number(),
      price: Yup.string(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation Fails' });
    }

    const { id } = req.params;

    const product = await Products.findOne({
      where: { id, owner_id: req.userId },
    });

    if (!product) {
      return res
        .status(401)
        .json({ error: 'Unable to find this product, verify infos' });
    }

    product.update(req.body);

    return res.status(200).json({ message: 'Product updated' });
  }

  async delete(req, res) {
    const schema = Yup.object().shape({
      id: Yup.number().required(),
    });

    if (!(await schema.isValid(req.params))) {
      return res.status(400).json({ error: 'Validation Fails' });
    }

    const { id } = req.params;

    const product = await Products.findOne({
      where: { id, owner_id: req.userId },
    });

    if (!product) {
      return res.status(401).json({ error: 'Could not find this product' });
    }

    await Products.destroy({
      where: {
        id,
        owner_id: req.userId,
      },
    });

    return res.status(200).json({ message: 'Product deleted' });
  }
}

export default new Merchant();
