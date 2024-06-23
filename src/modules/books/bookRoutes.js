const express = require("express");

const Router = express.Router();
const BookController = require("./bookController");
const middlewareUpload = require("../../middleware/upload");

Router.get("/", BookController.getAllBooks);
Router.get("/:id", BookController.getBookById);
Router.post("/postbook", middlewareUpload, BookController.postBooks);
Router.put("/updatebook/:id", middlewareUpload, BookController.updateBooks);
Router.delete("/deletebook/:id", BookController.deleteBook);

module.exports = Router;
