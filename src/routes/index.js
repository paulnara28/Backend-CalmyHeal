const express = require("express");

const Router = express.Router();
const authRoutes  = require("../modules/auth/authRoutes");
const artikelRoutes  = require("../modules/artikel/artikelRoutes");
const bookRoutes  = require("../modules/books/bookRoutes");
const summaryRoutes  = require("../modules/summaries/summariesRoutes");
const rekapJurnalRoutes  = require("../modules/rekap_jurnal/rekapJurnalRoutes");
const rekapOlahragaRoutes  = require("../modules/rekap_olahraga/rekapOlahragaRoutes");
const feedbackRoutes  = require("../modules/feedback/feedbackRoutes");
const meditationRoutes  = require("../modules/meditation/meditationRoutes");
const sportRoutes  = require("../modules/sport/sportRoutes");

Router.use("/auth", authRoutes);
Router.use("/artikel", artikelRoutes );
Router.use("/book", bookRoutes );
Router.use("/sport", sportRoutes );
Router.use("/feedback", feedbackRoutes );
Router.use("/meditation", meditationRoutes );
Router.use("/summary", summaryRoutes );
Router.use("/rekapjurnal", rekapJurnalRoutes );
Router.use("/rekapolahraga", rekapOlahragaRoutes );

module.exports = Router;
