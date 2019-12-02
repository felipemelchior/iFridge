module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('products', 'promo_activated', {
      type: Sequelize.BOOLEAN,
      allowNull: false,
    });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('products', 'promo_activated');
  },
};
