const jwt = require("jsonwebtoken");
const { response } = require("../utils");
require("dotenv").config();

const { resError } = response;

const isAuth = (req, res, next) => {
  if (!req.headers.authorization) {
    resError("Unauthorized", 401, null, res);
  } else {
    const splitToken = req.headers.authorization.split(" ");

    if (splitToken.length !== 2 || splitToken[0] !== "Bearer") {
      resError("Wrong authorization format", 400, null, res);
    } else {
      jwt.verify(
        splitToken[1],
        process.env.JWT_SECRET_KEY,
        { algorithms: ["HS256"] },
        (err, payload) => {
          if (err && err.name === "TokenExpiredError") {
            resError("Token expired", 401, null, res);
          } else if (err) {
            resError("Invalid Token", 401, null, res);
          } else {
            res.locals.tokenPayload = payload;
            next();
          }
        }
      );
    }
  }
};

module.exports = {
  isAuth,
};
