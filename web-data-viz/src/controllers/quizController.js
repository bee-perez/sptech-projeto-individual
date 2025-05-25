var quizModel = require("../models/quizModel");

function buscarQuizComPerguntas(req, res) {
    const fkQuiz = req.params.id;
    quizModel.buscarQuiz(fkQuiz)
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.error("Erro ao buscar perguntas e alternativas do quiz", erro)
            res.status(500).json({ erro: "Erro ao buscar perguntas e alternativas do quiz" })
        });
}

function criarResposta(req, res) {
  const { fkQuiz, fkUsuario } = req.body;

  quizModel.criarResposta(fkQuiz, fkUsuario)
      .then(() => res.status(201).send("Resposta registrada."))
      .catch((erro) => {
          console.error(erro);
          res.status(500).send("Erro ao registrar resposta.");
      });
}

function obterUltimaRespostaPorUsuario(req, res) {
  const { idUsuario } = req.params;

  quizModel.obterUltimaRespostaUsuario(idUsuario)
      .then((resultado) => res.status(200).json(resultado[0]))
      .catch((erro) => {
          console.error(erro);
          res.status(500).send("Erro ao buscar última resposta.");
      });
}

function criarAlternativasPorResposta(req, res) {
  const { fkResposta, letra } = req.body;

  quizModel.criarAlternativaPorResposta(fkResposta, letra)
      .then(() => res.status(201).send("Alternativa registrada."))
      .catch((erro) => {
          console.error(erro);
          res.status(500).send("Erro ao registrar alternativa.");
      });
}

module.exports = {
  buscarQuizComPerguntas,
  criarResposta,
  obterUltimaRespostaPorUsuario,
  criarAlternativasPorResposta
};