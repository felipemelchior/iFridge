import Sequelize, { Model } from 'sequelize';

class Products extends Model {
  static init(sequelize) {
    super.init(
      {
        name: Sequelize.STRING,
        price: Sequelize.FLOAT,
      },
      {
        sequelize,
      }
    );

    return this;
  }

  static associate(models) {
    this.belongsTo(models.Types, { foreignKey: 'type_id' });
    this.belongsTo(models.User, { foreignKey: 'owner_id' });
  }
}

export default Products;
