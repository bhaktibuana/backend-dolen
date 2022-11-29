const moment = require("moment");
const { userModel, roleModel } = require("../models");
const {
  connectionError,
  generateId,
  generateJwt,
  passwordHash,
  response,
} = require("../utils");

const { User } = userModel;
const { Role } = roleModel;
const { resSuccess, resError } = response;

const getUserList = (req, res) => {
  const count = res.locals.count;
  const limit = req.query.limit ? parseInt(req.query.limit) : 0;
  const offset = req.query.offset ? parseInt(req.query.offset) : 0;

  const next =
    offset >= 0 && limit > 0
      ? offset + limit >= count
        ? null
        : `${req.protocol}://${req.get("Host")}${req.originalUrl
            .split("?")
            .shift()}?limit=${limit}&offset=${offset + limit}`
      : null;
  const previous =
    offset >= 0 && limit > 0
      ? offset - limit < 0
        ? null
        : `${req.protocol}://${req.get("host")}${req.originalUrl
            .split("?")
            .shift()}?limit=${limit}&offset=${offset - limit}`
      : null;

  User.findAll({
    include: [
      {
        model: Role,
        attributes: ["name"],
        required: true,
      },
    ],
    attributes: {
      exclude: ["password", "roleId"],
    },
    limit,
    offset,
  })
    .then((results) => {
      if (results.length) {
        const data = results.map((item) => {
          const role = item.dataValues.role.dataValues.name;

          delete item.dataValues.role;

          return {
            ...item.dataValues,
            role,
          };
        });

        resSuccess("User list", 200, data, res, count, next, previous);
      } else {
        resError("User not found", 404, null, res);
      }
    })
    .catch((error) => connectionError(error, res));
};

const createUser = (req, res) => {
  const params = res.locals.params;
  const createdDate = moment().format("YYYY-MM-DD HH:mm:ss").toString();
  params.password = passwordHash(params.password);

  const payload = {
    userId: generateId("USER"),
    ...params,
    createdAt: createdDate,
    createdBy: "Guest",
    updatedAt: createdDate,
    updatedBy: "Guest",
    isDeleted: false,
  };

  User.create(payload)
    .then((results) => {
      if (results) {
        resSuccess("Registration success", 201, results, res);
      } else {
        resError("Registration failed", 400, null, res);
      }
    })
    .catch((error) => connectionError(error, res));
};

const login = (req, res) => {
  const payload = res.locals.params;
  payload.password = passwordHash(payload.password);

  User.findOne({
    where: { ...payload },
    include: [
      {
        model: Role,
        attributes: ["name"],
        required: false,
      },
    ],
    attributes: {
      exclude: [
        "password",
        "roleId",
        "createdAt",
        "createdBy",
        "updatedAt",
        "updatedBy",
      ],
    },
  })
    .then((results) => {
      if (results) {
        if (!results.dataValues.isDeleted) {
          const role = results.dataValues.role.dataValues.name;

          const data = results.dataValues;
          data.role = role;

          const token = generateJwt(data);

          resSuccess("Login success", 200, { payload: data, token }, res);
        } else {
          resError(
            "Your account isn't active, please contact admin",
            403,
            null,
            res
          );
        }
      } else {
        resError("Wrong password", 400, null, res);
      }
    })
    .catch((error) => connectionError(error, res));
};

module.exports = {
  getUserList,
  createUser,
  login,
};
