var express = require("express");
var router = express.Router();
var quizController = require("../controllers/quizController");

router.get("/:id", quizController.buscarQuizComPerguntas);
router.post("/resposta", quizController.criarResposta);
router.get("/resposta/ultima/:idUsuario", quizController.obterUltimaRespostaPorUsuario);
router.post("/resposta/alternativa", quizController.criarAlternativasPorResposta);

module.exports = router;
