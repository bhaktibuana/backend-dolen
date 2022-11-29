const { DataTypes, Op } = require("sequelize");
const { sequelize } = require("../../../config");

const Role = sequelize.define(
  "role",
  {
    roleId: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = {
  Role,
  sequelize,
  Op,
};
