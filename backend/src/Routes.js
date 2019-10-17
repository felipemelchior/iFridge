import { Router } from 'express';

import UserController from './app/controllers/User';
import SessionController from './app/controllers/Session';

import authMiddleware from './app/middlewares/auth';

const routes = new Router();

routes.post('/users', UserController.store);
routes.post('/sessions', SessionController.store);

routes.use(authMiddleware);

routes.get('/', (req, res) => {
  return res.json({ message: 'teste auth' });
});

export default routes;
