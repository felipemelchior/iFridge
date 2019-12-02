module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('users', 'address', {
      type: Sequelize.STRING,
      allowNull: true,
    });
  },

  down: queryInterface => {
    return queryInterface.dropTable('users', 'address');
  },
};
