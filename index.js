const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const xss = require("xss-clean");
const helmet = require("helmet");
const compression = require("compression");
const bodyParser = require("body-parser");
require("dotenv").config();
const routerNavigation = require("./src/routes/index"); // ./routes/index.js

const app = express();
const port = process.env.PORT;

app.use(morgan("dev"));
app.use(cors());
app.options("http://localhost:3000", cors());
app.use(xss());
app.use(helmet());
app.use(compression());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static("public"));

app.use("/", routerNavigation);

app.use("/*", (request, response) => {
  response.status(404).send("PATCH not found !");
});

app.listen(port, () => {
  // eslint-disable-next-line no-console
  console.log(`express app is listen on port ${port} !`);
});
