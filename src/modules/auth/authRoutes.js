const express = require("express");

const Router = express.Router();
const authController = require("./authController");

Router.post("/register",  authController.register);
Router.post("/login", authController.login);
Router.patch("/updatepass/:id", authController.updatePassword);


module.exports = Router;