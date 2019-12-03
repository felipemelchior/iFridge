module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('users', 'cep', {
      type: Sequelize.STRING,
      allowNull: false,
    });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('users', 'cep');
  },
};
