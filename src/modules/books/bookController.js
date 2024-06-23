const helperWrapper = require("../../helper/wrapper");
const BookModel = require("../books/bookModel");

module.exports = {
  getAllBooks: async (req, res) => {
    try {
      let {
        page = 1,
        limit = 10,
        search = "",
        sort = "created_at ASC",
      } = req.query;
      page = Number(page);
      limit = Number(limit);
      const offset = (page - 1) * limit;

      const totalData = await BookModel.getCountBooks(search);
      const totalPage = Math.ceil(totalData / limit);

      const pageInfo = {
        page,
        totalPage,
        limit,
        totalData,
      };

      const result = await BookModel.getAllBooks(limit, offset, search, sort);

      if (result.length < 1) {
        return helperWrapper.response(res, 200, "Data not found!", []);
      }

      return helperWrapper.response(
        res,
        200,
        "Success get data",
        result,
        pageInfo
      );
    } catch (error) {
      return helperWrapper.response(
        res,
        400,
        `Bad request (${error.message})`,
        null
      );
    }
  },

  getBookById: async (req, res) => {
    try {
      const { id } = req.params;
      const result = await BookModel.getBookById(id);

      if (result.length < 1) {
        return helperWrapper.response(
          res,
          404,
          `Data by id ${id} not found!`,
          null
        );
      }

      return helperWrapper.response(res, 200, "Success get data by id", result);
    } catch (error) {
      return helperWrapper.response(
        res,
        400,
        `Bad request (${error.message})`,
        null
      );
    }
  },

  postBooks: async (req, res) => {
    try {
      const { title, author, image } = req.body;

      if (!title || !author) {
        return helperWrapper.response(
          res,
          400,
          "Bad request (title and author are required)",
          null
        );
      }

      const data = {
        title,
        author,
        image: req.file ? req.file.filename : null,
        created_at: new Date(),
      };

      const result = await BookModel.postBooks(data);

      return helperWrapper.response(res, 200, "Success post data", result);
    } catch (error) {
      return helperWrapper.response(
        res,
        400,
        `Bad request (${error.message})`,
        null
      );
    }
  },

  updateBooks: async (req, res) => {
    try {
      const { id } = req.params;
      const { title, author, image } = req.body;

      if (!title || !author) {
        return helperWrapper.response(
          res,
          400,
          "Bad request (user_id and notes are required)",
          null
        );
      }

      const data = {
        title,
        author,
        image: req.file ? req.file.filename : null,
        created_at: new Date(),
      };

      // untuk mengupdate salah satu field saja
      Object.keys(data).forEach((data) => {
        if (!data[data]) {
          delete data[data];
        }
      });

      const result = await BookModel.updateBooks(id, data);

      return helperWrapper.response(res, 200, "Success update data", result);
    } catch (error) {
      return helperWrapper.response(
        res,
        400,
        `Bad request (${error.message})`,
        null
      );
    }
  },
  deleteBook: async (req, res) => {
    try {
      const { id } = req.params;

      const result = await BookModel.deleteBook(id);

      return helperWrapper.response(res, 200, "Success delete data", result);
    } catch (error) {
      return helperWrapper.response(
        res,
        400,
        `Bad request (${error.message})`,
        null
      );
    }
  },
};
