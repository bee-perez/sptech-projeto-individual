var express = require("express");
var router = express.Router();
var dashController = require("../controllers/dashController");


router.get('/usuarios/contar', dashController.contarUsuarios);
router.get('/usuarios/mesmo-stand/:idUsuario', dashController.contarUsuariosDoMesmoStand);
router.get("/relatorio/concordancia", dashController.relatorioConcordancia);
router.get('/usuario/stand/:idUsuario', dashController.obterStandDoUsuario);
router.get('/relatorio/top3-stands', dashController.obterTop3Stands);
router.get('/relatorio/letras-ultima/:idUsuario', dashController.contarRespostasPorLetraUltimaTentativa);
router.get('/relatorio/caracteristicas-stands', dashController.obterCaracteristicasStands);

module.exports = router;