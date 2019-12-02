module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('users', 'address', {
      type: Sequelize.STRING,
      allowNull: false,
    });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('users', 'address');
  },
};
