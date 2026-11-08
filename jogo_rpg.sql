-- =====================================================
-- Avaliação 1 - Banco de dados do jogo de RPG online
-- SGBD: SQL Server (SSMS)
-- Objetivo: criar o banco e as tabelas do diagrama
-- =====================================================


-- ---------------------------------------------
-- 1) Criando o banco de dados
-- ---------------------------------------------
-- Se o banco já existir, o comando dá erro (código 1801).
-- Por isso, selecione e execute só este bloco uma vez.
CREATE DATABASE RPGOnlineDB
GO

-- Seleciona o banco para as tabelas serem criadas nele
-- (confira se o banco certo aparece na barra do SSMS!)
USE RPGOnlineDB
GO


-- ---------------------------------------------
-- 2) Criando as tabelas
-- Ordem: primeiro as que NÃO têm chave estrangeira,
-- depois as que dependem delas.
-- ---------------------------------------------

-- Tabela USUARIOS
-- Guarda os dados de login de quem joga
CREATE TABLE Usuarios
(
     UsuarioId INT PRIMARY KEY IDENTITY      -- chave primária, gerada automaticamente
    ,Email VARCHAR(120) NOT NULL UNIQUE      -- não pode repetir nem ficar vazio
    ,Senha VARCHAR(255) NOT NULL             -- tamanho maior para caber a senha criptografada
)
GO

-- Tabela CLASSES
-- Tipos de personagem (ex: guerreiro, mago, arqueiro)
CREATE TABLE Classes
(
     ClasseId INT PRIMARY KEY IDENTITY
    ,Nome VARCHAR(60) NOT NULL UNIQUE
    ,Descricao TEXT                          -- TEXT porque a descrição pode ser grande
)
GO

-- Tabela HABILIDADES
-- Habilidades que as classes podem ter (ex: bola de fogo)
CREATE TABLE Habilidades
(
     HabilidadeId INT PRIMARY KEY IDENTITY
    ,Nome VARCHAR(60) NOT NULL UNIQUE
)
GO

-- Tabela PERSONAGENS
-- Um usuário pode ter vários personagens (1:N)
-- Cada personagem pertence a uma classe (N:1)
CREATE TABLE Personagens
(
     PersonagemId INT PRIMARY KEY IDENTITY
    ,NomePersonagem VARCHAR(60) NOT NULL UNIQUE
    -- chave estrangeira: referencia o dono do personagem
    ,UsuarioId INT NOT NULL FOREIGN KEY REFERENCES Usuarios(UsuarioId)
    -- chave estrangeira: referencia a classe do personagem
    ,ClasseId INT NOT NULL FOREIGN KEY REFERENCES Classes(ClasseId)
)
GO

-- Tabela CLASSES_HABILIDADES
-- Tabela de ligação da relação N:N entre Classes e Habilidades.
-- A chave primária é composta (ClasseId + HabilidadeId), então
-- a mesma habilidade não se repete na mesma classe.
CREATE TABLE Classes_Habilidades
(
     ClasseId INT NOT NULL FOREIGN KEY REFERENCES Classes(ClasseId)
    ,HabilidadeId INT NOT NULL FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
    ,PRIMARY KEY (ClasseId, HabilidadeId)
)
GO


-- ---------------------------------------------
-- 3) Conferindo se deu certo
-- ---------------------------------------------
-- Lista as tabelas criadas no banco
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
GO


-- ---------------------------------------------
-- Comandos de apoio (deixei comentados de propósito)
-- ---------------------------------------------
-- Exemplo de ALTER TABLE (adicionar uma coluna):
-- ALTER TABLE Personagens ADD Nivel INT
--
-- Exemplo de DROP COLUMN (remover a coluna):
-- ALTER TABLE Personagens DROP COLUMN Nivel
--
-- Para apagar uma tabela (cuidado, apaga os dados!).
-- Tabelas com chave estrangeira devem ser apagadas primeiro:
-- DROP TABLE Classes_Habilidades
-- DROP TABLE Personagens
-- DROP TABLE Habilidades
-- DROP TABLE Classes
-- DROP TABLE Usuarios
--
-- Para apagar o banco inteiro:
-- USE master
-- DROP DATABASE RPGOnlineDB
