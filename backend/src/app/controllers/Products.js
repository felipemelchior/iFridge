import Products from '../models/Products';
import User from '../models/User';
import Types from '../models/Types';

class ProductsController {
  async index(req, res) {
    const products = await Products.findAll({
      include: [
        {
          model: Types,
          attributes: ['id', 'name'],
        },
        {
          model: User,
          attributes: ['name', 'address', 'latitude', 'longitude'],
        },
      ],
      attributes: ['id', 'name', 'price', 'promo_price', 'promo_activated'],
    });

    return res.status(200).json(products);
  }
}

export default new ProductsController();
