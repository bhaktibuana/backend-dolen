const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const apiRouter = require("./src");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT;

app.use(cors());
app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use("/", apiRouter);

app.listen(PORT, () => {
  console.log("Server is listening on", PORT);
});
