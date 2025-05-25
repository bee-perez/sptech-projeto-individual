CREATE DATABASE standinside;

USE standinside;

CREATE TABLE stand (
    idStand INT PRIMARY KEY auto_increment,
    nome VARCHAR(45) unique,
    descricao VARCHAR(255),
    caracteristicas VARCHAR(45),
    personagem VARCHAR(45)
);

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    email VARCHAR(45) unique,
    senha VARCHAR(255),
    fkStand INT NULL,
    CONSTRAINT fk_usuario_stand FOREIGN KEY (fkStand) REFERENCES stand(idStand)
);

CREATE TABLE quiz (
    idQuiz INT PRIMARY KEY auto_increment,
    titulo VARCHAR(45),
    descricao VARCHAR(45),
    data_criacao DATETIME default current_timestamp
);

CREATE TABLE pergunta (
    idPergunta INT PRIMARY KEY auto_increment,
    fkQuiz INT,
    texto VARCHAR(255),
    CONSTRAINT fk_pergunta_quizz FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz)
);

CREATE TABLE alternativa (
    idAlternativa INT PRIMARY KEY auto_increment,
    texto VARCHAR(255),
    letra CHAR(1) CHECK (letra IN ('a','b','c','d','e','f','g','h','i')),
    fkPergunta INT,
    CONSTRAINT fk_alternativa_pergunta FOREIGN KEY (fkPergunta) REFERENCES pergunta(idPergunta)
);

CREATE TABLE resposta_usuario(
    idResposta INT PRIMARY KEY auto_increment,
    data_resposta DATETIME,
    concordancia_stand TINYINT,
    fkUsuario INT,
    fkQuiz INT,
    CONSTRAINT fk_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_quizz FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz)
);

CREATE TABLE resposta_alternativa(
    idresposta_alternativa INT PRIMARY KEY auto_increment,
    fkResposta INT,
	letra CHAR(1),
    CONSTRAINT fk_resposta FOREIGN KEY (fkResposta) REFERENCES resposta_usuario(idresposta)
);

-- ISERTS
-- Inserir os stands com seus donos e atributos
INSERT INTO stand (idStand, nome, descricao, caracteristicas, personagem) VALUES
(default, 'Whitesnake', 'Stand de controle mental e manipulação de memórias', 'lealdade', 'Enrico Pucci'),
(default, 'Stone Free', 'Stand de manipulação de fios', 'resiliência', 'Jolyne Kujo'),
(default, 'Star Platinum', 'Stand de força física e percepção altamente desenvolvida', 'força', 'Jotaro Kujo'),
(default, 'Burning Down the House', 'Stand de interação com fanatsmas e criação de objetos', 'estratégia', 'Emporio Alnino'),
(default, 'Foo Fighters', 'Stand que permite que os planctons existam em forma de humano', 'pertencimento', 'F.F.'),
(default, 'Weather Forecast', 'Stand de controle do clima e previsões', 'Sensibilidade', 'Weather Report'),
(default, 'Kiss', 'Stand de adesivo para criar duplicatas', 'determinação', 'Ermes Costello'),
(default, 'Diver Down', 'Stand que gaurda energia e tem capacidade de mergulhar em objetos e modificar sua estrutura', 'intensidade', 'Narciso Anasui'),
(default, 'The World', 'Stand de controle do tempo e domínio de movimentos', 'coragem', 'Dio Brando');


INSERT INTO usuario (idUsuario, nome, email, senha, fkStand) VALUES
(default, 'João Silva', 'joao@email.com', 'senha1', 2),
(default, 'Maria Oliveira', 'maria@email.com', 'senha2', 6),
(default, 'Carlos Almeida', 'carlos@email.com', 'senha3', 4),
(default, 'Fernanda Souza', 'fernanda@email.com', 'senha4', 5),
(default, 'Lucas Pereira', 'lucas@email.com', 'senha5', 6),
(default, 'Amanda Costa', 'amanda@email.com', 'senha6', 8),
(default, 'Renato Gomes', 'renato@email.com', 'senha7', 3),
(default, 'Juliana Lima', 'juliana@email.com', 'senha8', 9),
(default, 'Gabriel Santos', 'gabriel@email.com', 'senha9', 3),
(default, 'Ana Clara', 'anaclara@email.com', 'senha10', 1),
(default, 'Gustavo Martins', 'gustavo@email.com', 'senha11', 9),
(default, 'Beatriz Rocha', 'beatriz@email.com', 'senha12', 7),
(default, 'Marcos Ferreira', 'marcos@email.com', 'senha13', 2),
(default, 'Patrícia Silva', 'patricia@email.com', 'senha14', 6),
(default, 'Ricardo Almeida', 'ricardo@email.com', 'senha15', 4);

-- Inserir quiz
INSERT INTO quiz (idQuiz, titulo, descricao, data_criacao) VALUES
(default, 'Qual Stand é o seu? - Stone Ocean', 'Descubra qual Stand representa sua alma', default);


INSERT INTO pergunta (idPergunta, fkQuiz, TEXTO) VALUES
(default, 1, 'Quando você está sob pressão, o que faz?'),
(default, 1, 'Você está em um grupo que briga por justiça. Qual seu papel?'),
(default, 1, 'Qual dessas frases mais te representa?'),
(default, 1, 'Como você lida com perdas ou frustrações?'),
(default, 1, 'Se você fosse um poder, qual seria?'),
(default, 1, 'Como você enfrenta desafios inesperados?'),
(default, 1, 'Qual é a sua reação quando alguém desafia seus princípios?'),
(default, 1, 'Como você lida com a pressão de um grande objetivo?');

-- alternativas pergunta 1
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Prefiro resolver sozinho e em silêncio.', 'a', 1), 
(default, 'Corro atrás da solução com foco.', 'b', 1), 
(default, 'Me movimento rápido e enfrento de frente.', 'c', 1), 
(default, 'Procuro usar os recursos e pessoas ao meu redor.', 'd', 1),
(default, 'Busco ajuda de pessoas próximas.', 'e', 1), 
(default, 'Mantenho a calma e penso em silêncio.', 'f', 1), 
(default, 'Tento entender as causas profundamente.', 'g', 1), 
(default, 'Ajo estrategicamente e com planejamento.', 'h', 1), 
(default, 'Lidero com determinação e coragem.', 'i', 1);

-- alternativas pergunta 2
INSERT INTO alternativa (idAlternativa, texto, letra, fkpergunta) VALUES
(default, 'Aquele que usa inteligência emocional para controlar o grupo.', 'a', 2),
(default, 'Líder corajoso.', 'b', 2),
(default, 'Aquele que avança sem pensar nas consequências.', 'c', 2),
(default, 'O estrategista que observa tudo.', 'd', 2),
(default, 'Aquele que dá conselhos e apoia os outros.', 'e', 2),
(default, 'Aquele que organiza e mantém a calma.', 'f', 2),
(default, 'O que questiona e luta com firmeza.', 'g', 2),
(default, 'O que protege com lealdade.', 'h', 2),
(default, 'O que resolve com ações rápidas e eficientes.', 'i', 2);

-- alternativas pergunta 3
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, '“Não descanso até cumprir meu propósito.”', 'a', 3),
(default, '“A liberdade está dentro de mim.”', 'b', 3),
(default, '“A ação é a única forma de mudar.”', 'c', 3),
(default, '“Tudo tem um tempo, até a emoção.”', 'd', 3),
(default, '“Entender os outros me fortalece.”', 'e', 3),
(default, '“Eu sigo meu caminho com coragem.”', 'f', 3),
(default, '“A união faz minha força.”', 'g', 3),
(default, '“Eu vivo cada momento como se fosse o último.”', 'h', 3),
(default, '“O tempo é a chave para a mudança.”', 'i', 3);

-- alternativas pergunta 4

INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Busco seguir em frente rápido.', 'a', 4),
(default, 'Mantenho a calma e analiso a situação.', 'b', 4),
(default, 'Procurando a verdade em cada momento.', 'c', 4),
(default, 'Me concentro em novos projetos.', 'd', 4),
(default, 'Tento encontrar um novo significado.', 'e', 4),
(default, 'Reflito sozinho, em silêncio.', 'f', 4),
(default, 'Vou até o fim para corrigir.', 'g', 4),
(default, 'Fico determinado a restaurar o equilíbrio.', 'h', 4),
(default, 'Enfrento com ação direta.', 'i', 4);

-- alternativas pergunta 5
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Controle do tempo.', 'a', 5),
(default, 'Socos rápidos e precisos.', 'b', 5),
(default, 'Força imbatível e coragem.', 'c', 5),
(default, 'A habilidade de mudar qualquer situação.', 'd', 5),
(default, 'Cura através da água.', 'e', 5),
(default, 'Visão clara do futuro.', 'f', 5),
(default, 'Poder da multiplicação.', 'g', 5),
(default, 'Manipulação da realidade.', 'h', 5),
(default, 'Controle absoluto do espaço e tempo.', 'i', 5);

-- alternativas pergunta 6
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Com inteligência emocional e foco.', 'a', 6),
(default, 'Enfrento com coragem e determinação.', 'b', 6),
(default, 'Agindo rapidamente e sem hesitação.', 'c', 6),
(default, 'Com calma e pensamento estratégico.', 'd', 6),
(default, 'Com empatia, procurando entender os outros.', 'e', 6),
(default, 'Analisando todos os aspectos antes de agir.', 'f', 6),
(default, 'Com muita confiança e força.', 'g', 6),
(default, 'Sempre protegendo os outros ao meu redor.', 'h', 6),
(default, 'Com rapidez, sem perder tempo.', 'i', 6);


-- alternativas pergunta 7
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Eu me mantenho firme na minha visão.', 'a', 7),
(default, 'Eu sou implacável na defesa da verdade.', 'b', 7),
(default, 'Eu me defendo com tudo o que tenho.', 'c', 7),
(default, 'Eu uso a razão para convencer os outros.', 'd', 7),
(default, 'Eu busco entender e transformar o desafio.', 'e', 7),
(default, 'Eu me distancio e reflito.', 'f', 7),
(default, 'Eu protejo o que é justo.', 'g', 7),
(default, 'Eu sou leal ao que acredito.', 'h', 7),
(default, 'Eu enfrento de maneira prática e rápida.', 'i', 7);

-- alternativas pergunta 8
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Com uma visão clara e foco absoluto.', 'a', 8),
(default, 'Com coragem, sempre em frente.', 'b', 8),
(default, 'Com estratégias rápidas e precisas.', 'c', 8),
(default, 'Analisando as situações e agindo com estratégia.', 'd', 8),
(default, 'Com apoio dos outros, buscando empatia.', 'e', 8),
(default, 'Com calma, esperando o momento certo.', 'f', 8),
(default, 'Com uma energia imparável, sem dúvida.', 'g', 8),
(default, 'Com lealdade ao meu objetivo, sem desviar.', 'h', 8),
(default, 'Enfrento com rapidez e força de vontade.', 'i', 8);

 

-- lembrar de adicionar dados de respostas



-- selecionar todas as perguntas e alternativas de um quizz
SELECT 
	q.idQuiz AS quiz_id,
    q.titulo AS quiz_titulo, 
    P.idPergunta AS pergunta_id,
    p.TEXTO AS pergunta_texto, 
    a.idAlternativa AS alternativa_id,
    a.texto AS alternativa_texto, 
    a.letra AS alternativa_letra
FROM 
    quiz q
JOIN 
    pergunta p ON q.idQuiz = p.fkQuiz
JOIN 
    alternativa a ON p.idPergunta = a.fkPergunta
WHERE 
    q.idQuiz = 1
ORDER BY 
    p.idPergunta, a.idAlternativa;


 -- Select todas as as alternativas que um usuário especifico respondeu no quizz 
 
SELECT 
    a.letra AS alternativa,
    COUNT(ra.idresposta_alternativa) AS quantidade_respostas
FROM 
    resposta_alternativa ra
JOIN 
    alternativa a ON ra.idalternativa = a.idalternativa
JOIN 
    resposta_usuario ru ON ra.idresposta = ru.idresposta
WHERE 
    ru.idusuario = 2
GROUP BY 
    a.letra
ORDER BY 
    quantidade_respostas DESC;
    
    
-- selecionar a quantidade de usuários que possuem o mesmo Stand com base no nome do Stand
SELECT u.nome AS nome_usuario, s.nome AS nome_stand, q.idquizz
FROM usuario u
JOIN stand s ON u.stand_idstand = s.idstand
JOIN resposta_usuario r ON u.idusuario = r.idusuario
JOIN quiz q ON r.idquizz = q.idquizz
WHERE s.nome = 'Stone Free';

-- selecionar o número de usuários que responderam ao quiz
SELECT COUNT(DISTINCT idusuario) AS total_usuarios_responderam
FROM resposta_usuario;

-- selecionar os 3 Stands mais tirados
SELECT 
    s.nome AS nome_stand,
    COUNT(u.idusuario) AS total_usuarios
FROM 
    usuario u
JOIN 
    stand s ON u.stand_idstand = s.idstand
GROUP BY 
    s.nome
ORDER BY 
    total_usuarios DESC
LIMIT 3;

-- selecionar a quantidade de usuários que concordam, discordam ou não responderam à pergunta de concordância com stand
SELECT
  CASE
    WHEN concordancia_stand = 1 THEN 'Concorda'
    WHEN concordancia_stand = 0 THEN 'Discorda'
    ELSE 'Não respondeu'
  END AS situacao,
  COUNT(*) AS quantidade
FROM resposta_usuario
GROUP BY situacao;

-- selecionar todos os nomes dos Stands e todos os seus atributos
SELECT nome, caracteristicas
FROM stand;

SELECT * FROM usuario;

-- pegar as respostas do usuario
SELECT
    u.idUsuario,
    u.nome AS nome_usuario,
    ru.idResposta,
    ru.data_resposta,
    ra.idresposta_alternativa,
    ra.letra
FROM
    resposta_usuario ru
JOIN usuario u ON ru.fkUsuario = u.idUsuario
JOIN resposta_alternativa ra ON ra.fkResposta = ru.idResposta
ORDER BY
    u.idUsuario,
    ru.idResposta,
    ra.idresposta_alternativa;

-- pegar a ultima resposta
SELECT
    u.idUsuario,
    u.nome AS nome_usuario,
    ru.idResposta,
    ru.data_resposta,
    ra.idresposta_alternativa,
    ra.letra
FROM
    usuario u
JOIN resposta_usuario ru ON ru.fkUsuario = u.idUsuario
JOIN resposta_alternativa ra ON ra.fkResposta = ru.idResposta
JOIN (
    -- Subquery que retorna a última data_resposta para cada usuário
    SELECT fkUsuario, MAX(data_resposta) AS ultima_data
    FROM resposta_usuario
    GROUP BY fkUsuario
) ult ON ult.fkUsuario = ru.fkUsuario AND ult.ultima_data = ru.data_resposta
ORDER BY
    u.idUsuario,
    ru.idResposta,
    ra.idresposta_alternativa;
