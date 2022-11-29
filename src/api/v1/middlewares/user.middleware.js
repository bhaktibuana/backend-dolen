const { userModel, roleModel } = require("../models");
const { connectionError, response } = require("../utils");

const { User } = userModel;
const { Role } = roleModel;
const { resError } = response;

const checkEmailExist = (req, res, next) => {
  const email = res.locals.params.email;

  User.findOne({ where: { email } })
    .then((results) => {
      if (!results) {
        next();
      } else {
        resError(`User with email: ${email} already exist`, 400, null, res);
      }
    })
    .catch((error) => connectionError(error, res));
};

const getRoleId = (req, res, next) => {
  const params = res.locals.params;

  Role.findOne({ where: { name: "User" } })
    .then((results) => {
      if (results) {
        params.roleId = results.dataValues.roleId;
        res.locals.params = params;
        next();
      } else {
        resError("Selected role not found", 404, null, res);
      }
    })
    .catch((error) => connectionError(error, res));
};

const countUser = (req, res, next) => {
  User.count()
    .then((results) => {
      res.locals.count = results;
      next();
    })
    .catch((error) => connectionError(error, res));
};

const checkEmailLoginExist = (req, res, next) => {
  const email = res.locals.params.email;

  User.findOne({ where: { email } })
    .then((results) => {
      if (results) {
        next();
      } else {
        resError("User not found", 404, null, res);
      }
    })
    .catch((error) => connectionError(error, res));
};

const adminPermission = (req, res, next) => {
  const role = res.locals.tokenPayload.role;

  if (role === "Admin") {
    next();
  } else {
    resError("Limited access", 403, null, res);
  }
};

module.exports = {
  checkEmailExist,
  getRoleId,
  countUser,
  checkEmailLoginExist,
  adminPermission,
};
