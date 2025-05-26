var database = require("../database/config");

function contarUsuarios() {
  const instrucao = `
    SELECT COUNT(*) AS total_usuarios FROM usuario;
  `;
  return database.executar(instrucao);
}

function contarUsuariosDoMesmoStand(idUsuario) {
  const instrucao = `
      SELECT COUNT(*) AS total
      FROM usuario
      WHERE fkStand = (
          SELECT fkStand FROM usuario WHERE idUsuario = ${idUsuario}
      );
  `;
  return database.executar(instrucao);
}

function contarConcordanciaUltimaResposta() {
  const instrucao = `
    SELECT
      CASE
        WHEN ru.concordancia_stand = 1 THEN 'Concorda'
        WHEN ru.concordancia_stand = 0 THEN 'Discorda'
        ELSE 'Não respondeu'
      END AS situacao,
      COUNT(*) AS quantidade
    FROM resposta_usuario ru
    JOIN (
      SELECT fkUsuario, MAX(data_resposta) AS ultima_data
      FROM resposta_usuario
      GROUP BY fkUsuario
    ) ult ON ru.fkUsuario = ult.fkUsuario AND ru.data_resposta = ult.ultima_data
    GROUP BY situacao;
  `;
  return database.executar(instrucao);
}

module.exports = {
  contarUsuarios,
  contarUsuariosDoMesmoStand,
  contarConcordanciaUltimaResposta
};