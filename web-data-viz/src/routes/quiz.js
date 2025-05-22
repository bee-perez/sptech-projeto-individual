var express = require("express");
var router = express.Router();
var quizController = require("../controllers/quizController");

router.get("/:id", quizController.buscarQuizComPerguntas);

module.exports = router;
