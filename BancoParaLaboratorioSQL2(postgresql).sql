-- Utilização de mais de um SGBD
-- 1) Execute o script no MYSQL
-- 			R: Não funcionou
-- 2) Execute o script no POSTGRESQL
-- 			R: Não funcionou
-- 3) Faça as correções necessárias
-- 			R: O código abaixo está concertado para postgresql
--             A correção para MYSQL está em outro arquivo.

DROP TABLE IF EXISTS FILME_ATOR;
DROP TABLE IF EXISTS ATOR;
DROP TABLE IF EXISTS LOC_FITA;
DROP TABLE IF EXISTS FITA;
DROP TABLE IF EXISTS FILME;
DROP TABLE IF EXISTS CATEGORIA;
DROP TABLE IF EXISTS LOCACAO;
DROP TABLE IF EXISTS CLIENTE;

CREATE TABLE  CLIENTE
	(codCli		SERIAL PRIMARY KEY,
	 nome 		varchar(65) NOT NULL,
	 endereco	varchar(150) NOT NULL,
	 fone		INTEGER);


CREATE TABLE LOCACAO
	(codLoc		SERIAL PRIMARY KEY,
	 codCli 	INTEGER,
	 dtInicio 	date,
	 dtFim		date,
	 CONSTRAINT fk_CLIENTE_codCLi 
	 	FOREIGN KEY (codCli) 
		REFERENCES   CLIENTE(codCli));


CREATE TABLE  CATEGORIA
	(codCat		SERIAL PRIMARY KEY,
	 descricao	varchar(30) NOT NULL);


CREATE TABLE FILME
	(codFilme	SERIAL PRIMARY KEY,
	 titulo		varchar(65) NOT NULL,
	 codCat		INTEGER,
	 CONSTRAINT fk_CATEGORIA_codCat
	 	FOREIGN KEY (codCat) 
		REFERENCES   CATEGORIA(codCat));


CREATE TABLE FITA
	(codFita	SERIAL PRIMARY KEY,
	 codFilme 	INTEGER,
	 parte 		VARCHAR(1),
	 CONSTRAINT fk_FILME_codFilme
	 	FOREIGN KEY (codFilme)
		REFERENCES   FILME(codFilme));


CREATE TABLE LOC_FITA
	(codFita INTEGER,
	 codLoc  INTEGER,
	 CONSTRAINT fk_FITA_codFita
		FOREIGN KEY (codFita)
		REFERENCES FITA(codFita),
	 CONSTRAINT fk_LOCACAO_codLoc
	 	FOREIGN KEY (codLoc)
		REFERENCES LOCACAO(codLoc),
	 PRIMARY KEY (codFita, codLoc));


CREATE TABLE ATOR
	(codAtor	SERIAL PRIMARY KEY,
	 nreal		varchar(65) NOT NULL,
	 nFan		varchar(65) NOT NULL,
	 dtNasc		date);


CREATE TABLE FILME_ATOR
	(codFilme INTEGER,
	 codAtor  INTEGER,
	 CONSTRAINT fk_FILME_codFilme
		FOREIGN KEY (codFilme)
		REFERENCES FILME(codFilme),
	 CONSTRAINT fk_ATOR_codAtor
	 	FOREIGN KEY (codAtor)
		REFERENCES ATOR(codAtor));


ALTER TABLE FILME_ATOR
ADD PRIMARY KEY (codFilme, codAtor);



insert into CLIENTE(codCli, nome, endereco, fone) values(1, 'Maria da Silva', 'BSB', '12341234');
insert into CLIENTE(codCli, nome, endereco, fone) values(2, 'Jose Geraldo', 'São Paulo', '13243647');
insert into CLIENTE(codCli, nome, endereco, fone) values(3, 'Marcos da Silva', 'Rio de Janeiro', '34678923');
insert into CLIENTE(codCli, nome, endereco, fone) values(4, 'Marcelo Oliveira', 'Bélem', '13579323');
insert into CLIENTE(codCli, nome, endereco, fone) values(5, 'Marcos Antonio', 'Pará', '73839581');


insert into ATOR(codAtor, nreal, nFan, dtNasc) values(1, 'Leonardo DiCaprio', 'Leonardo DiCaprio', '1980-03-19');
insert into ATOR(codAtor, nreal, nFan, dtNasc) values(2, 'Kate Winslet', 'Kate Winslet', '1983-12-19');
insert into ATOR(codAtor, nreal, nFan, dtNasc) values(3, 'Antônio de Carvalho Barbosa', 'Toni Ramos', '1956-03-01');
insert into ATOR(codAtor, nreal, nFan, dtNasc) values(4, 'Antonio Rentao Aragao', 'Didi', '1980-05-20');
insert into ATOR(codAtor, nreal, nFan, dtNasc) values(5, 'Gloria Pires', 'Gloria Pires', '1980-07-19');


insert into CATEGORIA(codCat, descricao) values(1, 'Ação');
insert into CATEGORIA(codCat, descricao) values(2, 'Comédia');
insert into CATEGORIA(codCat, descricao) values(3, 'Desenho');
insert into CATEGORIA(codCat, descricao) values(4, 'Terror');
insert into CATEGORIA(codCat, descricao) values(5, 'Romance');


insert into FILME(codFilme, titulo, codCat) values(1, 'Titanic', 5);
insert into FILME(codFilme, titulo, codCat) values(2, 'Se eu fosse voce', 3);
insert into FILME(codFilme, titulo, codCat) values(3, 'Poderoso Chefão', 1);
insert into FILME(codFilme, titulo, codCat) values(4, 'Os Vagabundos Trapalhões', 2);
insert into FILME(codFilme, titulo, codCat) values(5, 'Massaropi', 2);


insert into FILME_ATOR(codFilme, codAtor) values(1, 1);
insert into FILME_ATOR(codFilme, codAtor) values(1, 2);
insert into FILME_ATOR(codFilme, codAtor) values(2, 3);
insert into FILME_ATOR(codFilme, codAtor) values(2, 5);
insert into FILME_ATOR(codFilme, codAtor) values(4, 4);
 

insert into FITA(codFita, codFilme, parte) values(1, 1, '1');
insert into FITA(codFita, codFilme, parte) values(2, 1, '1');
insert into FITA(codFita, codFilme, parte) values(3, 2, '1');
insert into FITA(codFita, codFilme, parte) values(4, 2, '2');
insert into FITA(codFita, codFilme, parte) values(5, 3, '1');


insert into LOCACAO(codLoc, codCli, dtInicio, dtFim) values(1, 1, '2009-02-02', '2009-02-05');
insert into LOCACAO(codLoc, codCli, dtInicio, dtFim) values(2, 1, '2009-02-02', '2009-02-05');
insert into LOCACAO(codLoc, codCli, dtInicio, dtFim) values(3, 2, '2009-05-02', '2009-05-05');
insert into LOCACAO(codLoc, codCli, dtInicio, dtFim) values(4, 3, '2009-02-10', '2009-02-12');
insert into LOCACAO(codLoc, codCli, dtInicio, dtFim) values(5, 3, '2009-02-15', '2009-02-17');


insert into LOC_FITA(codLoc, codFita) values(1, 1);
insert into LOC_FITA(codLoc, codFita) values(2, 2);
insert into LOC_FITA(codLoc, codFita) values(3, 3);
insert into LOC_FITA(codLoc, codFita) values(4, 4);
insert into LOC_FITA(codLoc, codFita) values(5, 5);



-- ###############################################
-- Consulta do banco de dados:
-- 1:
SELECT * FROM ATOR;

-- 2:
SELECT 
	FILME.titulo, CATEGORIA.descricao 
FROM
	FILME, CATEGORIA
WHERE FILME.codCat = CATEGORIA.codCat;

-- 3:
SELECT
	FILME.titulo as titulo, ATOR.nreal as nome_ator
FROM FILME_ATOR
	JOIN 
		FILME
	ON FILME.codFilme = FILME_ATOR.codFilme
	JOIN
		ATOR
	ON ATOR.codator = FILME_ATOR.codator;

-- 4:
-- Está tudo pronto na query de cima

-- 5:
SELECT FILME.titulo as titulo, ATOR.nreal as nome_ator
FROM FILME_ATOR
JOIN FILME ON FILME.codFilme = FILME_ATOR.codFilme
JOIN ATOR  ON ATOR.codator  = FILME_ATOR.codator
WHERE FILME_ATOR.codFilme = (SELECT FILME_ATOR.codFilme 
						     from FILME_ATOR 
						     WHERE FILME_ATOR.codator = (SELECT ATOR.codAtor 
						                                 FROM ATOR 
						                             	 WHERE ATOR.nreal = 'Gloria Pires')) 
ORDER BY ATOR.nreal; -- provavelmente tem uma forma melhor do que ter que fazer isso

-- 6:
SELECT ATOR.nreal AS atores_com_a
FROM ATOR
WHERE ATOR.nreal LIKE 'A%';

-- 7:
SELECT COUNT(CLIENTE.codcli)
FROM CLIENTE;

-- 8:
SELECT distinct CLIENTE.nome
from LOCACAO
join CLIENTE on LOCACAO.codcli = CLIENTE.codcli;
	
-- 9:
SELECT CLIENTE.nome, count(LOCACAO.codloc)
from LOCACAO
join CLIENTE on LOCACAO.codcli = CLIENTE.codcli
group by CLIENTE.nome;

-- 10:
select qtd_aluguel_cliente.nome_cliente 
from ( 
	SELECT CLIENTE.nome as nome_cliente, count(l.codloc) as qtd
 	from LOCACAO l 
	join CLIENTE on l.codcli = CLIENTE.codcli
    group by CLIENTE.codcli
) qtd_aluguel_cliente
where qtd_aluguel_cliente.qtd > 1;
