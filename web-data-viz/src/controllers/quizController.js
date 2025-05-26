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

function buscarStand(req, res) {
    const nome = req.params.nome;

    quizModel.buscarStandPorNome(nome)
        .then((resultado) => {
            if (resultado.length > 0) {
                res.status(200).json(resultado[0]);
            } else {
                res.status(404).send("Stand não encontrado.");
            }
        })
        .catch((erro) => {
            console.error("Erro ao buscar stand:", erro);
            res.status(500).send("Erro ao buscar stand.");
        });
}

function salvarStandUsuario(req, res) {
    const { idUsuario, idStand } = req.body;

    quizModel.salvarStandUsuario(idUsuario, idStand)
        .then(() => {
            res.status(200).send("Stand salvo com sucesso.");
        })
        .catch((erro) => {
            console.error("Erro ao salvar stand do usuário:", erro);
            res.status(500).send("Erro ao salvar stand.");
        });
}

function atualizarConcordancia(req, res) {
    const { idResposta, concordancia } = req.body;

    if (typeof concordancia !== 'number' || (concordancia !== 0 && concordancia !== 1)) {
        return res.status(400).send("Valor de concordância inválido. Use 0 (não) ou 1 (sim).");
    }

    quizModel.atualizarConcordanciaStand(idResposta, concordancia)
        .then(() => res.status(200).send("Concordância atualizada com sucesso."))
        .catch((erro) => {
            console.error("Erro ao atualizar concordância:", erro);
            res.status(500).send("Erro ao atualizar concordância.");
        });
}


module.exports = {
    buscarQuizComPerguntas,
    criarResposta,
    obterUltimaRespostaPorUsuario,
    criarAlternativasPorResposta,
    buscarStand,
    salvarStandUsuario,
    atualizarConcordancia
};