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

function obterStandDoUsuario(idUsuario) {
  const instrucao = `
    SELECT 
      s.nome AS nomeStand,
      s.descricao,
      s.caracteristicas,
      s.personagem
    FROM usuario u
    JOIN stand s ON u.fkStand = s.idStand
    WHERE u.idUsuario = ${idUsuario};
  `;
  return database.executar(instrucao);
}

function obterTop3Stands() {
  const instrucao = `
    SELECT 
        s.nome,
        s.descricao,
        COUNT(u.fkStand) AS total_usuarios
    FROM stand s
    JOIN usuario u ON s.idStand = u.fkStand
    GROUP BY s.idStand
    ORDER BY total_usuarios DESC
    LIMIT 3;
  `;
  return database.executar(instrucao);
}

function contarRespostasPorLetraUltimaTentativa(idUsuario) {
  const instrucao = `
    SELECT ra.letra, COUNT(*) AS quantidade
    FROM resposta_alternativa ra
    JOIN (
        SELECT idResposta
        FROM resposta_usuario
        WHERE fkUsuario = ${idUsuario}
        ORDER BY data_resposta DESC
        LIMIT 1
    ) ultima_resposta ON ra.fkResposta = ultima_resposta.idResposta
    GROUP BY ra.letra
    ORDER BY ra.letra;
  `;
  return database.executar(instrucao);
}

function obterCaracteristicasStands() {
  const instrucao = `
    SELECT idStand, nome, caracteristicas FROM stand;
  `;
  return database.executar(instrucao);
}

module.exports = {
  contarUsuarios,
  contarUsuariosDoMesmoStand,
  contarConcordanciaUltimaResposta,
  obterStandDoUsuario,
  obterTop3Stands,
  contarRespostasPorLetraUltimaTentativa,
  obterCaracteristicasStands
};