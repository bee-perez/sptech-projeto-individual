CREATE DATABASE standinside;

USE standinside;

CREATE TABLE stand (
    idstand INT PRIMARY KEY auto_increment,
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
    stand_idstand INT NULL,
    CONSTRAINT fk_usuario_stand FOREIGN KEY (stand_idstand) REFERENCES stand(idstand)
);

CREATE TABLE quiz (
    idquizz INT PRIMARY KEY auto_increment,
    titulo VARCHAR(45),
    descricao VARCHAR(45),
    data_criacao DATETIME default current_timestamp
);

CREATE TABLE pergunta (
    idpergunta INT PRIMARY KEY auto_increment,
    idquizz INT,
    TEXTO VARCHAR(255),
    CONSTRAINT fk_pergunta_quizz FOREIGN KEY (idquizz) REFERENCES quiz(idquizz)
);

CREATE TABLE alternativa (
    idalternativa INT PRIMARY KEY auto_increment,
    texto VARCHAR(255),
    letra CHAR(1) CHECK (letra IN ('a','b','c','d','e','f','g','h','i')),
    idpergunta INT,
    CONSTRAINT fk_alternativa_pergunta FOREIGN KEY (idpergunta) REFERENCES pergunta(idpergunta)
);

CREATE TABLE resposta_usuario(
    idresposta INT PRIMARY KEY auto_increment,
    data_resposta DATETIME,
    concordancia_stand TINYINT,
    idusuario INT,
    idquizz INT,
    CONSTRAINT fk_usuario FOREIGN KEY (idusuario) REFERENCES usuario(idusuario),
    CONSTRAINT fk_quizz FOREIGN KEY (idquizz) REFERENCES quiz(idquizz)
);

CREATE TABLE resposta_alternativa(
    idresposta_alternativa INT PRIMARY KEY auto_increment,
    idresposta INT,
    idalternativa INT,
    CONSTRAINT fk_resposta FOREIGN KEY (idresposta) REFERENCES resposta_usuario(idresposta),
    CONSTRAINT fk_resposta_alternativa FOREIGN KEY (idalternativa) REFERENCES alternativa(idalternativa)
);

-- ISERTS
-- Inserir os stands com seus donos e atributos
INSERT INTO stand (idstand, nome, descricao, caracteristicas, personagem) VALUES
(default, 'Whitesnake', 'Stand de controle mental e manipulação de memórias', 'lealdade', 'Enrico Pucci'),
(default, 'Stone Free', 'Stand de manipulação de fios', 'resiliência', 'Jolyne Kujo'),
(default, 'Star Platinum', 'Stand de força física e percepção altamente desenvolvida', 'força', 'Jotaro Kujo'),
(default, 'Burning Down the House', 'Stand de interação com fanatsmas e criação de objetos', 'estratégia', 'Emporio Alnino'),
(default, 'Foo Fighters', 'Stand que permite que os planctons existam em forma de humano', 'pertencimento', 'F.F.'),
(default, 'Weather Forecast', 'Stand de controle do clima e previsões', 'Sensibilidade', 'Weather Report'),
(default, 'Kiss', 'Stand de adesivo para criar duplicatas', 'determinação', 'Ermes Costello'),
(default, 'Diver Down', 'Stand que gaurda energia e tem capacidade de mergulhar em objetos e modificar sua estrutura', 'intensidade', 'Narciso Anasui'),
(default, 'The World', 'Stand de controle do tempo e domínio de movimentos', 'coragem', 'Dio Brando');


INSERT INTO usuario (idUsuario, nome, email, senha, stand_idstand) VALUES
(default, 'João Silva', 'joao@jojo.com', 'senha1', 2),
(default, 'Maria Oliveira', 'maria@jojo.com', 'senha2', 6),
(default, 'Carlos Almeida', 'carlos@jojo.com', 'senha3', 4),
(default, 'Fernanda Souza', 'fernanda@jojo.com', 'senha4', 5),
(default, 'Lucas Pereira', 'lucas@jojo.com', 'senha5', 6),
(default, 'Amanda Costa', 'amanda@jojo.com', 'senha6', 8),
(default, 'Renato Gomes', 'renato@jojo.com', 'senha7', 3),
(default, 'Juliana Lima', 'juliana@jojo.com', 'senha8', 9),
(default, 'Gabriel Santos', 'gabriel@jojo.com', 'senha9', 3),
(default, 'Ana Clara', 'anaclara@jojo.com', 'senha10', 1),
(default, 'Gustavo Martins', 'gustavo@jojo.com', 'senha11', 9),
(default, 'Beatriz Rocha', 'beatriz@jojo.com', 'senha12', 7),
(default, 'Marcos Ferreira', 'marcos@jojo.com', 'senha13', 2),
(default, 'Patrícia Silva', 'patricia@jojo.com', 'senha14', 6),
(default, 'Ricardo Almeida', 'ricardo@jojo.com', 'senha15', 4);

-- Inserir quiz
INSERT INTO quiz (idquizz, titulo, descricao, data_criacao) VALUES
(default, 'Qual Stand é o seu? - Stone Ocean', 'Descubra qual Stand representa sua alma', default);


INSERT INTO pergunta (idpergunta, idquizz, TEXTO) VALUES
(default, 1, 'Quando você está sob pressão, o que faz?'),
(default, 1, 'Você está em um grupo que briga por justiça. Qual seu papel?'),
(default, 1, 'Qual dessas frases mais te representa?'),
(default, 1, 'Como você lida com perdas ou frustrações?'),
(default, 1, 'Se você fosse um poder, qual seria?'),
(default, 1, 'Como você enfrenta desafios inesperados?'),
(default, 1, 'Qual é a sua reação quando alguém desafia seus princípios?'),
(default, 1, 'Como você lida com a pressão de um grande objetivo?');

-- alternativas pergunta 1
INSERT INTO alternativa (idalternativa, texto, letra, idpergunta) VALUES
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
INSERT INTO alternativa (idalternativa, texto, letra, idpergunta) VALUES
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
INSERT INTO alternativa (idalternativa, texto, letra, idpergunta) VALUES
(default, '“Não descanso até cumprir meu propósito.”', 'b', 3),
(default, '“A liberdade está dentro de mim.”', 'a', 3),
(default, '“A ação é a única forma de mudar."', 'g', 3),
(default, '“O tempo é a chave para a mudança.”', 'i', 3),
(default, '“Entender os outros me fortalece.”', 'c', 3),
(default, '“Tudo tem um tempo, até a emoção.”', 'd', 3),
(default, '“Eu sigo meu caminho com coragem.”', 'e', 3),
(default, '“A perfeição é alcançada com esforço constante.”', 'f', 3),
(default, '“Eu vivo cada momento como se fosse o último.”', 'h', 3);

-- alternativas pergunta 4

INSERT INTO alternativa (idalternativa, texto, letra, idpergunta) VALUES
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
INSERT INTO alternativa (idalternativa, texto, letra, idpergunta) VALUES
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
INSERT INTO alternativa (idalternativa, texto, letra, idpergunta) VALUES
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
INSERT INTO alternativa (idalternativa, texto, letra, idpergunta) VALUES
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
INSERT INTO alternativa (idalternativa, texto, letra, idpergunta) VALUES
(default, 'Com uma visão clara e foco absoluto.', 'a', 8),
(default, 'Com coragem, sempre em frente.', 'b', 8),
(default, 'Com estratégias rápidas e precisas.', 'c', 8),
(default, 'Analisando as situações e agindo com estratégia.', 'd', 8),
(default, 'Com apoio dos outros, buscando empatia.', 'e', 8),
(default, 'Com calma, esperando o momento certo.', 'f', 8),
(default, 'Com uma energia imparável, sem dúvida.', 'g', 8),
(default, 'Com lealdade ao meu objetivo, sem desviar.', 'h', 8),
(default, 'Enfrento com rapidez e força de vontade.', 'i', 8);

INSERT INTO resposta_usuario (idresposta, data_resposta, concordancia_stand, idusuario, idquizz) VALUES
(default, default, 1, 1, 1),
(default, default, 1, 2, 1),
(default, default, 1, 3, 1),
(default, default, 1, 4, 1),
(default, default, 1, 5, 1),
(default, default, 1, 6, 1),
(default, default, 1, 7, 1),
(default, default, 1, 8, 1),
(default, default, 1, 9, 1),
(default, default, 1, 10, 1),
(default, default, 1, 11, 1),
(default, default, 0, 12, 1),
(default, default, 0, 13, 1),
(default, default, 0, 14, 1),
(default, default, 0, 15, 1);

-- Inserir respostas alternativas para cada usuário

-- João Silva - Stand 'Stone Free'
INSERT INTO resposta_alternativa (idresposta, idalternativa) VALUES 
(1, 2),  
(1, 11),
(1, 20), 
(1, 29), 
(1, 38),  
(1, 47),  
(1, 57),  
(1, 64);  

-- Maria Oliveira - Stand 'Weather Forecast'
INSERT INTO resposta_alternativa (idresposta, idalternativa) VALUES 
(2, 6),  
(2, 15), 
(2, 26), 
(2, 31), 
(2, 40),  
(2, 50),  
(2, 59), 
(2, 72);  

-- lembrar de adicionar o resto



-- selecionar todas as perguntas e alternativas de um quizz
SELECT 
    q.titulo AS quiz_titulo, 
    p.TEXTO AS pergunta_texto, 
    a.texto AS alternativa_texto, 
    a.letra AS alternativa_letra,
    a.idalternativa AS alternativa_id
FROM 
    quiz q
JOIN 
    pergunta p ON q.idquizz = p.idquizz
JOIN 
    alternativa a ON p.idpergunta = a.idpergunta
WHERE 
    q.idquizz = 1
ORDER BY 
    p.idpergunta, a.idalternativa;


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

