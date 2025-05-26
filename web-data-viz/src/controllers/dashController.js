var dashModel = require("../models/dashModel");

function contarUsuarios(req, res) {
  dashModel.contarUsuarios()
    .then(resultado => {
      res.status(200).json(resultado[0]);
    })
    .catch(erro => {
      console.error("Erro ao contar usuários:", erro);
      res.status(500).send("Erro ao contar usuários.");
    });
}

function contarUsuariosDoMesmoStand(req, res) {
  const idUsuario = req.params.idUsuario;

  if (!idUsuario) {
      return res.status(400).send("ID do usuário não fornecido.");
  }

  dashModel.contarUsuariosDoMesmoStand(idUsuario)
      .then(resultado => {
          res.status(200).json(resultado[0]);
      })
      .catch(erro => {
          console.error("Erro ao contar usuários do mesmo stand:", erro);
          res.status(500).send("Erro ao contar usuários.");
      });
}

function relatorioConcordancia(req, res) {
  dashModel.contarConcordanciaUltimaResposta()
    .then(resultado => {
      res.status(200).json(resultado);
    })
    .catch(err => {
      console.error("Erro ao gerar relatório:", err);
      res.status(500).send("Erro ao gerar relatório de concordância.");
    });
}

module.exports = {
  contarUsuarios,
  contarUsuariosDoMesmoStand,
  relatorioConcordancia
};