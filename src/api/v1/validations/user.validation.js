const yup = require("yup");
const { response } = require("../utils");

const { resError } = response;

const registerValidation = (req, res, next) => {
  const params = req.body;

  const data = {
    name: params.name,
    email: params.email,
    password: params.password,
    passwordConfirmation: params.passwordConfirmation,
  };

  const schema = yup.object().shape({
    name: yup.string().max(100).required(),
    email: yup.string().email().max(100).required(),
    password: yup.string().min(8).required(),
    passwordConfirmation: yup
      .string()
      .min(8)
      .matches(data.password, "password doesn't match")
      .required(),
  });

  schema
    .validate(data, { abortEarly: false })
    .then(() => {
      delete data.passwordConfirmation;
      res.locals.params = data;
      next();
    })
    .catch((error) => {
      resError("Invalid registration data", 400, error.errors, res);
    });
};

const loginValidation = (req, res, next) => {
  const params = req.body;

  const data = {
    email: params.email,
    password: params.password,
  };

  const schema = yup.object().shape({
    email: yup.string().email().max(100).required(),
    password: yup.string().min(8).required(),
  });

  schema
    .validate(data, { abortEarly: false })
    .then(() => {
      res.locals.params = data;
      next();
    })
    .catch((error) => {
      resError("Invalid login data", 400, error.errors, res);
    });
};

module.exports = {
  registerValidation,
  loginValidation,
};
