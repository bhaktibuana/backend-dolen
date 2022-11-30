const { roleModel } = require("../models");
const { connectionError, response } = require("../utils");

const { Role } = roleModel;
const { resSuccess, resError } = response;

const getData = (req, res) => {
  Role.findAll()
    .then((results) => {
      if (results.length) {
        resSuccess("Role data", 200, results, res);
      } else {
        resError("Data not found", 404, null, res);
      }
    })
    .catch((error) => connectionError(error, res));
};

module.exports = {
  getData,
};
