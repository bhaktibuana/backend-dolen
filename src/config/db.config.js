const { Sequelize } = require("sequelize");
require("dotenv").config();

const dbConfig = (database) => {
  const dbParams = {
    host: process.env.DB_HOST,
    username: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database,
  };

  return new Sequelize(
    dbParams.database,
    dbParams.username,
    dbParams.password,
    {
      host: dbParams.host,
      dialect: "mysql",
      // logging: false,
    }
  );
};

const db = dbConfig(process.env.DB_NAME);

module.exports = db;
