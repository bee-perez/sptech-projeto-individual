var express = require("express");
var router = express.Router();
var quizController = require("../controllers/quizController");

router.get("/stand/:nome", quizController.buscarStand);
router.post("/salvar-stand", quizController.salvarStandUsuario);
router.get("/:id", quizController.buscarQuizComPerguntas);
router.post("/resposta", quizController.criarResposta);
router.get("/resposta/ultima/:idUsuario", quizController.obterUltimaRespostaPorUsuario);
router.post("/resposta/alternativa", quizController.criarAlternativasPorResposta);
router.put("/resposta/concordancia", quizController.atualizarConcordancia);

module.exports = router;
