const express = require("express");
const userRoute = require("./user.route");
const roleRoute = require("./role.route");

const router = express.Router();

router.use("/user", userRoute);
router.use("/role", roleRoute);

module.exports = router;
