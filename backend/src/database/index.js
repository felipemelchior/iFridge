import Sequelize from 'sequelize';

import databaseConfig from '../config/database';

import User from '../app/models/User';
import Types from '../app/models/Types';

const models = [User, Types];

class Database {
  constructor() {
    this.init();
    // this.mongo()
  }

  init() {
    this.connection = new Sequelize(databaseConfig);

    models.map(model => {
      model.init(this.connection);
    });
  }
}

export default new Database();
