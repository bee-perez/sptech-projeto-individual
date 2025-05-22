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

module.exports = {
  buscarQuizComPerguntas
};