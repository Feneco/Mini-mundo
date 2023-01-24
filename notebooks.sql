CREATE TABLE tb_estado (
	id_estado int NOT NULL PRIMARY KEY,
	estado varchar(45)
);


CREATE TABLE td_categoria (
	id_categoria int NOT NULL PRIMARY KEY,
	categoria varchar(200)
);


CREATE TABLE td_sexo (
	id_sexo int NOT NULL PRIMARY KEY,
	sexo varchar(20)
);


CREATE TABLE td_tipo_email (
	id_tipo_email int NOT NULL PRIMARY KEY,
	tipo_email varchar(45)
);


CREATE TABLE td_tipo_endereco (
	id_tipo_endereco int NOT NULL PRIMARY KEY,
	tipo_endereco varchar(100)
);


CREATE TABLE td_tipo_telefone (
	id_tipo_telefone int NOT NULL PRIMARY KEY,
	tipo_telefone varchar(45)
);


CREATE TABLE td_tipo_usuario (
	id_tipo_usuario int NOT NULL PRIMARY KEY,
	tipo_usuario varchar(45)
);


CREATE TABLE tb_cidade (
	id_cidade int NOT NULL PRIMARY KEY,
	cidade varchar(45),
	tb_estado_id_estado int
);


CREATE TABLE tb_dados (
	id_dados int NOT NULL PRIMARY KEY,
	nome varchar(255),
	cpf_cnpj varchar(20),
	td_sexo_id_sexo int
);


CREATE TABLE tb_email (
	id_email int NOT NULL PRIMARY KEY,
	email varchar(255),
	tb_dados_id_dados int,
	td_tipo_email_id_tipo_email int
);


CREATE TABLE tb_item (
	id_item int NOT NULL PRIMARY KEY,
	item varchar(100),
	descricao varchar(255),
	ativo smallint,
	qtd_estoque int,
	imagem bytea,
	td_categoria_id_categoria int
);


CREATE TABLE tb_telefone (
	id_telefone int NOT NULL PRIMARY KEY,
	telefone varchar(25),
	tb_dados_id_dados int,
	td_tipo_telefone_id_tipo_telefone int
);


CREATE TABLE tb_usuario (
	id_usuario int NOT NULL PRIMARY KEY,
	login varchar(100),
	senha varchar(255),
	ativo smallint,
	td_tipo_usuario_id_tipo_usuario int,
	tb_dados_id_dados int
);


CREATE TABLE ta_doacao (
	tb_item_id_item int,
	tb_usuario_id_usuario int,
	qtd_saida int
);


CREATE TABLE ta_recebe (
	tb_item_id_item int,
	tb_usuario_id_usuario int,
	qtd_entrada int
);


CREATE TABLE tb_bairro (
	id_bairro int NOT NULL PRIMARY KEY,
	bairro varchar(45),
	tb_cidade_id_cidade int
);


CREATE TABLE tb_endereco (
	id_endereco int NOT NULL PRIMARY KEY,
	cep varchar(15),
	numero varchar(100),
	complemento varchar(255),
	td_tipo_endereco_id_tipo_endereco int,
	tb_bairro_id_bairro int
);


CREATE TABLE ta_moradia (
	tb_dados_id_dados int,
	tb_endereco_id_endereco int
);




ALTER TABLE
	tb_cidade
	ADD CONSTRAINT
		tb_cidade_fk
	FOREIGN KEY 
		(tb_estado_id_estado)
	REFERENCES 
		tb_estado(id_estado);


ALTER TABLE
	tb_dados
	ADD CONSTRAINT
		tb_dados_fk
	FOREIGN KEY 
		(td_sexo_id_sexo)
	REFERENCES 
		td_sexo(id_sexo);


ALTER TABLE
	tb_email
	ADD CONSTRAINT
		tb_email_fk
	FOREIGN KEY 
		(tb_dados_id_dados)
	REFERENCES 
		tb_dados(id_dados);


ALTER TABLE
	tb_email
	ADD CONSTRAINT
		tb_email_fk_1
	FOREIGN KEY 
		(td_tipo_email_id_tipo_email)
	REFERENCES 
		td_tipo_email(id_tipo_email);

ALTER TABLE
	tb_item
	ADD CONSTRAINT
		tb_item_fk
	FOREIGN KEY 
		(td_categoria_id_categoria)
	REFERENCES 
		td_categoria(id_categoria);


ALTER TABLE
	tb_telefone
	ADD CONSTRAINT
		tb_telefone_fk
	FOREIGN KEY 
		(tb_dados_id_dados)
	REFERENCES 
		tb_dados(id_dados);


ALTER TABLE
	tb_telefone
	ADD CONSTRAINT
		tb_telefone_fk_1
	FOREIGN KEY 
		(td_tipo_telefone_id_tipo_telefone)
	REFERENCES 
		td_tipo_telefone(id_tipo_telefone);


ALTER TABLE
	tb_usuario
	ADD CONSTRAINT
		tb_usuario_fk
	FOREIGN KEY 
		(td_tipo_usuario_id_tipo_usuario)
	REFERENCES 
		td_tipo_usuario(id_tipo_usuario);


ALTER TABLE
	tb_usuario
	ADD CONSTRAINT
		tb_usuario_fk_1
	FOREIGN KEY 
		(tb_dados_id_dados)
	REFERENCES 
		tb_dados(id_dados);


ALTER TABLE
	ta_doacao
	ADD CONSTRAINT
		ta_doacao_fk
	FOREIGN KEY 
		(tb_item_id_item)
	REFERENCES 
		tb_item(id_item);


ALTER TABLE
	ta_doacao
	ADD CONSTRAINT
		ta_doacao_fk_1
	FOREIGN KEY 
		(tb_usuario_id_usuario)
	REFERENCES 
		tb_usuario(id_usuario);


ALTER TABLE
	ta_recebe
	ADD CONSTRAINT
		ta_recebe_fk
	FOREIGN KEY 
		(tb_item_id_item)
	REFERENCES 
		tb_item(id_item);


ALTER TABLE
	ta_recebe
	ADD CONSTRAINT
		ta_recebe_fk_1
	FOREIGN KEY 
		(tb_usuario_id_usuario)
	REFERENCES 
		tb_usuario(id_usuario);


ALTER TABLE
	tb_bairro
	ADD CONSTRAINT
		tb_bairro_fk
	FOREIGN KEY 
		(tb_cidade_id_cidade)
	REFERENCES 
		tb_cidade(id_cidade);


ALTER TABLE
	tb_endereco
	ADD CONSTRAINT
		tb_endereco_fk
	FOREIGN KEY 
		(td_tipo_endereco_id_tipo_endereco)
	REFERENCES 
		td_tipo_endereco(id_tipo_endereco);


ALTER TABLE
	tb_endereco
	ADD CONSTRAINT
		tb_endereco_fk_1
	FOREIGN KEY 
		(tb_bairro_id_bairro)
	REFERENCES 
		tb_bairro(id_bairro);


ALTER TABLE
	ta_moradia
	ADD CONSTRAINT
		ta_moradia_fk
	FOREIGN KEY 
		(tb_dados_id_dados)
	REFERENCES 
		tb_dados(id_dados);


ALTER TABLE
	ta_moradia
	ADD CONSTRAINT
		ta_moradia_fk_1
	FOREIGN KEY 
		(tb_endereco_id_endereco)
	REFERENCES 
		tb_endereco(id_endereco);
