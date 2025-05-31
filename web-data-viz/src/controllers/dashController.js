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

function obterStandDoUsuario(req, res) {
  const idUsuario = req.params.idUsuario;

  if (!idUsuario) {
    return res.status(400).send("ID do usuário não fornecido.");
  }

  dashModel.obterStandDoUsuario(idUsuario)
    .then(resultado => {
      if (resultado.length > 0) {
        res.status(200).json(resultado[0]);
      } else {
        res.status(404).send("Stand não encontrado para o usuário.");
      }
    })
    .catch(erro => {
      console.error("Erro ao obter stand do usuário:", erro);
      res.status(500).send("Erro ao obter stand do usuário.");
    });
}

function obterTop3Stands(req, res) {
  dashModel.obterTop3Stands()
    .then(resultado => {
      res.status(200).json(resultado);
    })
    .catch(erro => {
      console.error("Erro ao obter top 3 stands:", erro);
      res.status(500).send("Erro ao obter top 3 stands.");
    });
}

function contarRespostasPorLetraUltimaTentativa(req, res) {
  const idUsuario = req.params.idUsuario;

  if (!idUsuario) {
    return res.status(400).send("ID do usuário não fornecido.");
  }

  dashModel.contarRespostasPorLetraUltimaTentativa(idUsuario)
    .then(resultado => {
      res.status(200).json(resultado);
    })
    .catch(erro => {
      console.error("Erro ao contar respostas por letra:", erro);
      res.status(500).send("Erro ao contar respostas por letra.");
    });
}

function obterCaracteristicasStands(req, res) {
  dashModel.obterCaracteristicasStands()
    .then(resultado => {
      res.status(200).json(resultado);
    })
    .catch(erro => {
      console.error("Erro ao obter características dos stands:", erro);
      res.status(500).send("Erro ao obter características.");
    });
}


module.exports = {
  contarUsuarios,
  contarUsuariosDoMesmoStand,
  relatorioConcordancia,
  obterStandDoUsuario,
  obterTop3Stands,
  contarRespostasPorLetraUltimaTentativa,
  obterCaracteristicasStands
};