var express = require("express");
var router = express.Router();
var dashController = require("../controllers/dashController");


router.get('/usuarios/contar', dashController.contarUsuarios);
router.get('/usuarios/mesmo-stand/:idUsuario', dashController.contarUsuariosDoMesmoStand);
router.get("/relatorio/concordancia", dashController.relatorioConcordancia);

module.exports = router;