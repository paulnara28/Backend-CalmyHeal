const connection = require("../../config/mysql");

module.exports = {
  getAllBooks: (limit, offset, search, sort) =>
    new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM books WHERE title LIKE '%${search}%' ORDER BY ${sort} LIMIT ? OFFSET ?`,
        [limit, offset],
        (err, result) => {
          if (!err) {
            resolve(result);
          } else {
            reject(new Error(`SQL : ${err.message}`));
          }
        }
      );
    }),

  getBookById: (id) => {
    return new Promise((resolve, reject) => {
      const query = "SELECT * FROM books WHERE id = ?";
      connection.query(query, [id], (err, result) => {
        if (err) {
          return reject(new Error(`SQL: ${err.message}`));
        }
        resolve(result);
      });
    });
  },

  getCountBooks: (search) => {
    return new Promise((resolve, reject) => {
      const query = "SELECT COUNT(*) AS total FROM books WHERE title LIKE ?";
      connection.query(query, [`%${search}%`], (err, result) => {
        if (err) {
          return reject(new Error(`SQL: ${err.message}`));
        }
        resolve(result[0].total);
      });
    });
  },

  postBooks: (data) =>
    new Promise((resolve, reject) => {
      const query = `INSERT INTO books SET ?`;
      connection.query(query, data, (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error(`SQL : ${err.message}`));
        }
      });
    }),

  updateBooks: (id, data) =>
    new Promise((resolve, reject) => {
      const query = `UPDATE books SET ? WHERE id = ?`;
      connection.query(query, [data, id], (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error(`SQL : ${err.message}`));
        }
      });
    }),
  deleteBook: (id) =>
    new Promise((resolve, reject) => {
      const query = `DELETE FROM books WHERE id = ?`;
      connection.query(query, id, (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error(`SQL : ${err.message}`));
        }
      });
    }),
};
