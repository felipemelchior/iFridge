module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('products', 'promo_price', {
      type: Sequelize.FLOAT,
      allowNull: true,
    });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('products', 'promo_price');
  },
};
