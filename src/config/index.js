const dbConfig = require("./db.config");
const apiConfig = require("./api.config");

module.exports = {
  sequelize: dbConfig,
  api: apiConfig,
};
