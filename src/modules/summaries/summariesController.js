/* eslint-disable guard-for-in */
/* eslint-disable no-restricted-syntax */
const helperWrapper = require("../../helper/wrapper");
const summariesModel = require("./summariesModel");
const SumarryModel = require("./summariesModel");

module.exports = {
  getAllSumarry: async (req, res) => {
    try {
      let { page, limit, search, sort, book_id } = req.query;
      page = Number(page) || 1;
      limit = Number(limit) || 10;
      search = search || "";
      sort = sort || "created_at ASC";
      let offset = page * limit - limit;

      if (!book_id) {
        return helperWrapper.response(
          res,
          400,
          "Bad request (book_id is required)",
          null
        );
      }

      const totalData = await SumarryModel.getCountSumarry(
        search,
        book_id
      );
      const totalPage = Math.ceil(totalData / limit);
      if (totalPage < page) {
        offset = 0;
        page = 1;
      }
      const pageInfo = {
        page,
        totalPage,
        limit,
        totalData,
      };

      const result = await SumarryModel.getAllSumarry(
        limit,
        offset,
        search,
        sort,
        book_id
      );

      if (result.length < 1) {
        return helperWrapper.response(res, 200, `Data not found!`, []);
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
  getSummaryById: async (req, res) => {
    try {
      const { id } = req.params;
      const result = await summariesModel.getSummaryById(id);
      if (result.length < 1) {
        return helperWrapper.response(
          res,
          404,
          `data by id ${id} not found !`,
          null
        );
      }
      return helperWrapper.response(
        res,
        200,
        "succes get data by id merchant",
        result
      );
    } catch (error) {
      return helperWrapper.response(
        res,
        400,
        `bad request (${error.message})`,
        null
      );
    }
  },
};
