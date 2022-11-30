const express = require("express");
const { userValidation } = require("../validations");
const { userMiddleware, authMiddleware } = require("../middlewares");
const { userController } = require("../controllers");

const router = express.Router();

router.post(
  "/register",
  userValidation.registerValidation,
  userMiddleware.checkEmailExist,
  userMiddleware.getRoleId,
  userController.createUser
);

router.post(
  "/login",
  userValidation.loginValidation,
  userMiddleware.checkEmailLoginExist,
  userController.login
);

router.get(
  "/",
  authMiddleware.isAuth,
  authMiddleware.adminPermission,
  userMiddleware.countUser,
  userController.getUserList
);

module.exports = router;
