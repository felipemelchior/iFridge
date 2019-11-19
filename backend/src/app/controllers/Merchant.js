import * as Yup from 'yup';

import Merchant from '../models/Merchant';
import Types from '../models/Types';

class Merchant {
  async index(req, res) {
    const types = await Types.findAll();

    return res.json(types);
  }

  async store(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string().required(),
      type: Yup.number().required(),
      price: Yup.string().required(),
    });

    if(!(schema.isValid(req.body))) {
      return res.status(400).json({error: 'Validation Fails'});
    }

    const { name, type, price } = req.body;

    const productExists = await Merchant.findOne({ where: { name } });

    if(!productExists) {
      return res.status(401).json({error: 'Product already exist'});
    }

    const typeExists = await Types.findByPk(type);

    if(!typeExists) {
      return res.status(401).json({error: 'Type does not exist'});
    }

    const newProduct = await Merchant.create({ name, type, price })
    return res.status(200).json(newProduct);
  }

  async update(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string(),
      type: Yup.number(),
      price: Yup.string(),
    })

    if(!(schema.isValid(req.body))){
      return res.status(400).json({error: 'Validation Fails'})
    }

    const { id } = req.query;

    const product = await Merchant.findByPk(id)

    if(!product) {
      return res.status(401).json({ error: 'Unable to find this product, verify infos' })
    }

    product.update(req.body)

    const { id, name, type, price } = await Merchant.findByPk(id, {
      include: [
        {
          model: Types,
          as: 'type',
          attributes: ['id', 'name'],
        },
      ],
    }),

    return res.status(200).json({id, name, type, price})
  }

  async delete(req, res) {
    const schema = Yup.number().required()

    if(!(schema.isValid(req.params))) {
      return res.status(400).json({error: 'Validation Fails'});
    }

    const { id } = req.params

    const product = await Merchant.findByPk(id)

    if(!product) {
      return res.status(401).json({error: 'Could not find this product'});
    }

    await Merchant.destroy({where: {
      id
    }})
  }
}

export default Merchant;
