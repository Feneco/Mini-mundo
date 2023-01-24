/* brModelo: */

CREATE TABLE Filme (
    Codigo INTEGER PRIMARY KEY,
    Titulo VARCHAR,
    fk_Categoria_Codigo INTEGER
);

CREATE TABLE Fita (
    Codigo INTEGER PRIMARY KEY,
    fk_Filme_Codigo INTEGER
);

CREATE TABLE Categoria (
    Codigo INTEGER PRIMARY KEY,
    Descricao VARCHAR
);

CREATE TABLE Ator (
    Codigo INTEGER PRIMARY KEY,
    Nome VARCHAR,
    Data_de_nascimento DATE
);

CREATE TABLE Atua (
    fk_Filme_Codigo INTEGER,
    fk_Ator_Codigo INTEGER,
    Nome_do_personagem VARCHAR
);

CREATE TABLE Fitas_Alugadas (
    fk_Fita_Codigo INTEGER,
    fk_Aluguel_Codigo INTEGER
);

CREATE TABLE Aluguel (
    Codigo INTEGER PRIMARY KEY,
    Data_inicio DATE,
    Data_fim DATE,
    fk_Cliente_Codigo INTEGER
);
 
CREATE TABLE Cliente (
    Codigo INTEGER PRIMARY KEY,
    Nome VARCHAR,
    Telefone VARCHAR,
    Endereço VARCHAR
);


ALTER TABLE Fita ADD CONSTRAINT FK_Fita_2
    FOREIGN KEY (fk_Filme_Codigo)
    REFERENCES Filme (Codigo)
    ON DELETE RESTRICT;

ALTER TABLE Atua ADD CONSTRAINT FK_Atua_1
    FOREIGN KEY (fk_Filme_Codigo)
    REFERENCES Filme (Codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE Atua ADD CONSTRAINT FK_Atua_2
    FOREIGN KEY (fk_Ator_Codigo)
    REFERENCES Ator (Codigo)
    ON DELETE SET NULL;
 
ALTER TABLE Filme ADD CONSTRAINT FK_Filme_2
    FOREIGN KEY (fk_Categoria_Codigo)
    REFERENCES Categoria (Codigo)
    ON DELETE RESTRICT;

ALTER TABLE Aluguel ADD CONSTRAINT FK_Aluguel_2
    FOREIGN KEY (fk_Cliente_Codigo)
    REFERENCES Cliente (Codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE Fitas_Alugadas ADD CONSTRAINT FK_Fitas_Alugadas_1
    FOREIGN KEY (fk_Fita_Codigo)
    REFERENCES Fita (Codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE Fitas_Alugadas ADD CONSTRAINT FK_Fitas_Alugadas_2
    FOREIGN KEY (fk_Aluguel_Codigo)
    REFERENCES Aluguel (Codigo)
    ON DELETE SET NULL;


/* 4 - Apague algumas tabelas e depois tente recriá-las */
DROP TABLE Cliente;

CREATE TABLE Cliente (
    Codigo INTEGER PRIMARY KEY,
    Nome VARCHAR,
    Telefone VARCHAR,
    Endereço VARCHAR
)

/* 5 - Insira 5 registros em cada tabela do banco de dados */

INSERT INTO Cliente (Codigo, Nome, Telefone, Endereço) VALUES 
    (1, "Wagner", "98765-4321", "Asa Norte");

INSERT INTO Categoria(Codigo, Descricao) VALUES
    (1, "Ação");

INSERT INTO Filme (Codigo, Titulo, fk_Categoria_Codigo) VALUES
    (1, "007 - Skyfall", 1);

INSERT INTO Fita (Codigo, fk_Filme_Codigo) VALUES
    (1, 1);

INSERT INTO Fita (Codigo, fk_Filme_Codigo) VALUES
    (2, 1)

INSERT INTO Aluguel(Codigo, Data_inicio, Data_fim, fk_Cliente_Codigo) VALUES
    (1, "22/12/22", "07/01/23", 1);

/* 6 - Apague alguns registros. Tente apagar registros que tenham chaves primárias
 *     referenciadas por chaves estrangeiras. Esse procedimento deu algum erro? Qual? */

DELETE FROM Fita 
/* 7 - Utilize o comando SELECT para acessar os dados inseridos nos bancos de dados */
