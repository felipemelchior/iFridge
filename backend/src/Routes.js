import { Router } from 'express';

import UserController from './app/controllers/User';
import SessionController from './app/controllers/Session';

import authMiddleware from './app/middlewares/auth';
import merchantMiddleware from './app/middlewares/merchant';

const routes = new Router();

routes.post('/users', UserController.store);
routes.post('/sessions', SessionController.store);

routes.use(authMiddleware);

routes.use(merchantMiddleware);

routes.get('/', (req, res) => {
  return res.json({ message: req.merchant });
});

export default routes;
