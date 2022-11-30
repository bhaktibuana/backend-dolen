const express = require("express");
const { authMiddleware } = require("../middlewares");
const { roleController } = require("../controllers");

const router = express.Router();

router.get(
  "/",
  authMiddleware.isAuth,
  authMiddleware.adminPermission,
  roleController.getData
);

module.exports = router;
