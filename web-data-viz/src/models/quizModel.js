var database = require("../database/config");

function buscarQuiz(fkQuiz) {
  const instrucao = `
    SELECT 
      q.idQuiz AS quiz_id,
      q.titulo AS quiz_titulo, 
      p.idPergunta AS pergunta_id,
      p.TEXTO AS pergunta_texto, 
      a.idAlternativa AS alternativa_id,
      a.texto AS alternativa_texto, 
      a.letra AS alternativa_letra
    FROM quiz q
    JOIN pergunta p ON q.idQuiz = p.fkQuiz
    JOIN alternativa a ON p.idPergunta = a.fkPergunta
    WHERE q.idQuiz = ${fkQuiz}
    ORDER BY p.idPergunta, a.idAlternativa;
    `;
  console.log("Executando a instrução SQL:\n" + instrucao);
  return database.executar(instrucao);
}

function criarResposta(fkQuiz, fkUsuario) {
    const instrucao = `
        INSERT INTO resposta_usuario (data_resposta, fkUsuario, fkQuiz)
        VALUES (NOW(), ${fkUsuario}, ${fkQuiz});
    `;
    return database.executar(instrucao);
}

function obterUltimaRespostaUsuario(fkUsuario) {
    const instrucao = `
        SELECT idResposta FROM resposta_usuario
        WHERE fkUsuario = ${fkUsuario}
        ORDER BY idResposta DESC LIMIT 1;
    `;
    return database.executar(instrucao);
}

function criarAlternativaPorResposta(fkResposta, letra) {
  const instrucao = `
    INSERT INTO resposta_alternativa (fkResposta, letra)
    VALUES (${fkResposta}, '${letra}');
  `;
  return database.executar(instrucao);
}

function buscarStandPorNome(nome) {
  const instrucao = `
    SELECT * FROM stand WHERE nome = '${nome}';
  `;
  return database.executar(instrucao);
}

function salvarStandUsuario(idUsuario, idStand) {
  const instrucao = `
    UPDATE usuario SET fkStand = ${idStand} WHERE idUsuario = ${idUsuario};
  `;
  return database.executar(instrucao);
}

function atualizarConcordanciaStand(idResposta, concordancia) {
  const instrucao = `
      UPDATE resposta_usuario
      SET concordancia_stand = ${concordancia}
      WHERE idResposta = ${idResposta};
  `;
  return database.executar(instrucao);
}

module.exports = {
  buscarQuiz,
  criarResposta,
  obterUltimaRespostaUsuario,
  criarAlternativaPorResposta,
  buscarStandPorNome,
  salvarStandUsuario,
  atualizarConcordanciaStand
};

