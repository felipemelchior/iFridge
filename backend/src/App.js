import express from 'express';
import Youtch from 'youtch';

class App {
  constructor() {
    this.server = express();
    this.middlewares();
    this.routes();
  }

  middlewares() {
    this.server.use(express.json());
  }

  routes() {}

  exceptionHandler() {
    // Youch
  }
}

export default new App().server;
