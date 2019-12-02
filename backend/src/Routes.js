import { Router } from 'express';

import UserController from './app/controllers/User';
import SessionController from './app/controllers/Session';
import TypesController from './app/controllers/Types';
import MerchantController from './app/controllers/Merchant';

import authMiddleware from './app/middlewares/auth';
import merchantMiddleware from './app/middlewares/merchant';

const routes = new Router();

routes.post('/users', UserController.store);
routes.post('/sessions', SessionController.store);

routes.use(authMiddleware);

routes.put('/users', UserController.update);

routes.use(merchantMiddleware);

routes.get('/types', TypesController.index);
routes.post('/types', TypesController.store);

routes.get('/merchant', MerchantController.index);
routes.post('/merchant', MerchantController.store);
routes.put('/merchant/:id', MerchantController.update);
routes.delete('/merchant/:id', MerchantController.delete);

routes.get('/', (req, res) => {
  return res.json({ message: req.merchant });
});

export default routes;
