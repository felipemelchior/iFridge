module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('users', 'latitude', {
      type: Sequelize.STRING,
      allowNull: false,
    });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('users', 'latitude');
  },
};
