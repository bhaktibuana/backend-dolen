const express = require("express");
const { api } = require("./config");
const apiV1Routes = require("./api/v1/routes");
const router = express.Router();

router.use(api.v1, apiV1Routes);

router.use(api.v1, (_, res) => {
  res.status(200).json({
    message: "Dolen (Dompet Online) API V1",
  });
});

router.use(api.v2, (_, res) => {
  res.status(200).json({
    message: "Dolen (Dompet Online) API V2",
  });
});

router.use("/", (_, res) => {
  res.status(200).json({
    message: "Dolen (Dompet Online) API Server",
  });
});

module.exports = router;
