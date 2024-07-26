DROP SCHEMA IF EXISTS BancoFisio;
CREATE SCHEMA BancoFisio;
USE BancoFisio;

CREATE TABLE Profissional (
idProfissional integer primary key,
datanascimento date,
nome varchar (30)
);

create table endereco (
idEndereco integer primary key auto_increment,
logradouro varchar (70),
num integer,
complemento varchar(15),
cep varchar(9)
);

create table Contato (
idContato integer primary key auto_increment,
num_princ integer not null,
num_sec integer,
email varchar (40)
);

create table EstCivil (
idEstCivil integer primary key auto_increment,
tipoEstado varchar (30)
);

create table Escolaridade(
idEscolaridade integer primary key,
nivel varchar (20),
andamento varchar (10)
);

CREATE TABLE Renda (
    idRenda INTEGER PRIMARY KEY AUTO_INCREMENT,
    faixa VARCHAR(30)
);


create table dominancia(
idDominancia integer primary key auto_increment,
lado varchar (20)
);


create table acometido(
idAcometido integer primary key auto_increment,
lado varchar (20)
);

CREATE TABLE Paciente(
cpf varchar(11) primary key,
pnome varchar (20),
unome varchar (50),
idEndereco integer,
idContato integer,
idade integer,
sexo char,
idEstCivil integer,
idEscolaridade integer,
idRenda integer,
profissao varchar (50),
idDominancia integer,
idAcometido integer,
CONSTRAINT fk_endereco_pac FOREIGN KEY(idEndereco) REFERENCES endereco(idEndereco),
CONSTRAINT fk_contato_pac FOREIGN KEY(idContato) REFERENCES Contato(idContato),
CONSTRAINT fk_estcivil_pac FOREIGN KEY(idEstCivil) REFERENCES EstCivil(idEstCivil),
CONSTRAINT fk_escolaridade_pac FOREIGN KEY(idEscolaridade) REFERENCES Escolaridade(idEscolaridade),
CONSTRAINT fk_dominancia_pac FOREIGN KEY(idDominancia) REFERENCES Dominancia(idDominancia),
CONSTRAINT fk_acometido_pac FOREIGN KEY(idAcometido) REFERENCES Acometido(idAcometido)

);

CREATE TABLE atendimento(
dataAtendimento date,
cpfPac varchar(11),
idProfissional integer,
CONSTRAINT PK_atendimento PRIMARY KEY(dataAtendimento, cpfPac),
CONSTRAINT fk_pac_cpf FOREIGN KEY(cpfPac) REFERENCES Paciente(cpf),
CONSTRAINT fk_id_prof FOREIGN KEY(idProfissional) REFERENCES Profissional(idProfissional)
);



-- Inserções nas tabelas
# endereco
INSERT INTO Endereco (logradouro, num, complemento, cep) VALUES
('Rua A', 123, 'Apto 4', '12345-678'),
('Avenida B', 456, 'Casa 1', '23456-789'),
('Rua C', 789, 'Sala 302', '34567-890'),
('Praça D', 101, NULL, '45678-901'),
('Rua E', 202, 'Bloco B', '56789-012'),
('Avenida F', 303, 'Apto 12', '67890-123'),
('Rua G', 404, 'Casa 2', '78901-234'),
('Praça H', 505, 'Loja 3', '89012-345'),
('Rua I', 606, 'Apto 10', '90123-456'),
('Avenida J', 707, 'Casa 5', '01234-567');


# Contato
INSERT INTO Contato (num_princ, num_sec, email) VALUES
(123456789, 987654321, 'contato1@exemplo.com'),
(234567890, 876543210, 'contato2@exemplo.com'),
(345678901, 765432109, 'contato3@exemplo.com'),
(456789012, 654321098, 'contato4@exemplo.com'),
(567890123, 543210987, 'contato5@exemplo.com'),
(678901234, 432109876, 'contato6@exemplo.com'),
(789012345, 321098765, 'contato7@exemplo.com'),
(890123456, 210987654, 'contato8@exemplo.com'),
(901234567, 109876543, 'contato9@exemplo.com'),
(123450987, 987650432, 'contato10@exemplo.com');


# EstCivil
INSERT INTO EstCivil (tipoEstado) VALUES
('Solteiro'),
('Casado'),
('Divorciado'),
('Viúvo'),
('Separado');


# Escolaridade
INSERT INTO Escolaridade (idEscolaridade, nivel, andamento) VALUES
(8,'Superior', 'Completo'),
(3,'Médio', 'Incompleto'),
(2,'Fundamental', 'Completo'),
(1,'Fundamental', 'Incompleto'),
(4,'Médio', 'Completo'),
(5,'Técnico', 'Incompleto'),
(6,'Técnico', 'Completo'),
(7,'Superior', 'Incompleto');


# Dominancia
INSERT INTO Dominancia (lado) VALUES
('Direito'),
('Esquerdo'),
('Ambidestro');


# Acometido
INSERT INTO Acometido (lado) VALUES
('Direito'),
('Esquerdo'),
('Ambos');


# Renda
INSERT INTO Renda (faixa) VALUES
('Baixa'),
('Média'),
('Alta'),
('Muito Alta'),
('Muito Baixa');


# Profissional
INSERT INTO Profissional (idProfissional, datanascimento, nome) VALUES
(123, '1980-01-01', 'Dr. João'),
(153, '1975-05-15', 'Dra. Maria'),
(321, '1983-07-20', 'Dr. Pedro'),
(456, '1990-09-10', 'Dra. Ana'),
(542, '1978-12-05', 'Dr. Carlos'),
(682, '1985-03-18', 'Dra. Luana'),
(791, '1972-11-22', 'Dr. Eduardo'),
(863, '1987-08-30', 'Dra. Fernanda'),
(941, '1992-06-25', 'Dr. Gustavo'),
(108, '1984-02-14', 'Dra. Patrícia');


# Paciente
INSERT INTO Paciente (cpf, pnome, unome, idEndereco, idContato, idade, sexo, idEstCivil, idEscolaridade, idRenda, profissao, idDominancia, idAcometido) VALUES
(12345678900, 'Carlos', 'Silva', 1, 1, 30, 'M', 1, 1, 2, 'Engenheiro', 1, 2),
(98765432100, 'Ana', 'Oliveira', 2, 2, 25, 'F', 2, 2, 1, 'Professor', 2, 1),
(23456789012, 'Pedro', 'Santos', 3, 3, 40, 'M', 3, 3, 3, 'Arquiteto', 2, 1),
(34567890123, 'Juliana', 'Costa', 4, 4, 28, 'F', 1, 1, 4, 'Dentista', 1, 3),
(45678901234, 'Marcos', 'Pereira', 5, 5, 35, 'M', 2, 4, 5, 'Médico', 3, 2),
(56789012345, 'Lucia', 'Lima', 6, 6, 32, 'F', 2, 5, 1, 'Psicóloga', 2, 1),
(67890123456, 'Roberto', 'Almeida', 7, 7, 45, 'M', 1, 2, 2, 'Advogado', 1, 2),
(78901234567, 'Sofia', 'Fernandes', 8, 8, 29, 'F', 4, 3, 3, 'Engenheira', 3, 1),
(89012345678, 'Eduardo', 'Ribeiro', 9, 9, 38, 'M', 3, 4, 4, 'Professor', 2, 2),
(90123456789, 'Mariana', 'Souza', 10, 10, 27, 'F', 1, 2, 5, 'Arquiteta', 1, 3),
(12345678001, 'Lucas', 'Mendes', 1, 2, 31, 'M', 3, 4, 2, 'Mecânico', 1, NULL),
(23456789001, 'Beatriz', 'Martins', 2, 3, 26, 'F', 4, 1, 1, 'Farmacêutica', 2, NULL),
(34567890001, 'Roberta', 'Gomes', 3, 4, 33, 'F', 2, 2, 2, 'Enfermeira', 3, 1),
(45678900001, 'Tiago', 'Pinto', 4, 5, 37, 'M', 1, 3, 3, 'Administrador', 2, 2),
(56789000001, 'Camila', 'Alves', 5, 6, 29, 'F', 2, 4, 1, 'Nutricionista', 1, 3);


# atendimento
INSERT INTO Atendimento (dataAtendimento, cpfPac, idProfissional) VALUES
-- 5 atendimentos no mesmo dia
('2024-07-20', 12345678900, 153),
('2024-07-20', 45678901234, 153),
('2024-07-20', 23456789001, 153),
('2024-07-20', 89012345678, 153),
('2024-07-20', 90123456789, 153),
-- 3 atendimentos em 2 dias diferentes
('2024-07-21', 98765432100, 108),
('2024-07-22', 23456789012, 682),
('2024-07-22', 34567890123, 791),
-- Dados adicionais variados
('2024-07-23', 45678901234, 863),
('2024-07-24', 56789012345, 542),
('2024-07-25', 67890123456, 321),
('2024-07-26', 78901234567, 542),
('2024-07-26', 89012345678, 456),
('2024-07-28', 90123456789, 941);




-- - Sugestões de Consultas SQL - - -
# Consulta com junção interna
-- Listar todos os atendimentos com detalhes dos pacientes e profissionais
SELECT a.dataAtendimento, p.pnome, p.unome, pr.nome AS nome_profissional
FROM Atendimento a
INNER JOIN Paciente p ON a.cpfPac = p.cpf
INNER JOIN Profissional pr ON a.idProfissional = pr.idProfissional;

-- Objetivo: Relacionar atendimentos com pacientes e profissionais, útil para verificar quais pacientes foram atendidos por quais profissionais.


# Consulta com junção externa
-- Listar todos os pacientes e seus atendimentos, mesmo aqueles que não tiveram atendimentos registrados
SELECT p.pnome, p.unome, a.dataAtendimento
FROM Paciente p
LEFT JOIN Atendimento a ON p.cpf = a.cpfPac;

-- Objetivo: Exibir pacientes mesmo que não tenham atendimentos, útil para verificar pacientes que ainda não foram atendidos.


# Consulta com subconsulta
-- Listar todos os profissionais que atenderam mais de 3 pacientes
SELECT nome
FROM Profissional
WHERE idProfissional IN (
    SELECT idProfissional
    FROM Atendimento
    GROUP BY idProfissional
    HAVING COUNT(*) > 3
);

-- Objetivo: Identificar profissionais que tiveram um volume maior de atendimentos, útil para avaliar carga de trabalho dos profissionais.


# Consulta com função agregada e agrupamento
-- Contar o número de atendimentos por dia
SELECT dataAtendimento, COUNT(*) AS total_atendimentos
FROM Atendimento
GROUP BY dataAtendimento
HAVING COUNT(*) > 1;

-- Objetivo: Verificar dias com mais de um atendimento, útil para identificar dias mais movimentados.


# Consulta com junção e função agregada
-- Listar nome do profissional e contar o número de atendimentos para saber quantos profissionais realizaram atendimentos além do limite estipulado de 2
SELECT pr.nome, COUNT(a.idProfissional) AS total_atendimentos
FROM Atendimento a
INNER JOIN Profissional pr ON a.idProfissional = pr.idProfissional
GROUP BY pr.nome
HAVING COUNT(a.idProfissional) > 2;

-- Objetivo: Identificar profissionais com mais de dois atendimentos, útil para análise da distribuição de trabalho entre profissionais.

# Lista o nome do profissional e a média de idade dos pacientes atendidos por ele
SELECT prof.nome, AVG(pac.idade) as Media_Idade
FROM  Atendimento A
INNER JOIN Paciente Pac ON A.cpfPac = Pac.cpf
INNER JOIN  Profissional Prof ON A.idProfissional = Prof.idProfissional
GROUP BY Prof.nome
HAVING  AVG(pac.idade);

-- Objetivo: Saber a média de idade dos pacientes de cada profissional para poder personalizar o atendimento e a comunicação de acordo com as características e necessidades específicas daquela faixa etária.