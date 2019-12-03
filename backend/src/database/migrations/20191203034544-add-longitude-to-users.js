module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('users', 'longitude', {
      type: Sequelize.STRING,
      allowNull: false,
    });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('users', 'longitude');
  },
};
