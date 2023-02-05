-- estado é unico. Pode dar problema
INSERT INTO tb_estado (
	estado ) 
VALUES (
	estado_usuario );


INSERT INTO tb_cidade (
	cidade, 	
	tb_estado_id_estado ) 
VALUES (
	cidade_usuario,
	(SELECT id_estado FROM tb_estado 
	 WHERE estado=estado_usuario));


INSERT INTO tb_bairro (
	bairro,
	tb_cidade_id_cidade )
VALUES (
	bairro_usuario,
	(SELECT id_cidade FROM tb_cidade
	 WHERE cidade=cidade_usuario));


-- tipo_endereco é unico. Pode dar problema
INSERT INTO td_tipo_endereco (
	tipo_endereco)
VALUES (
	tipo_endereco_usuario);


INSERT INTO tb_endereco (
	cep,
	numero,
	complemento,
	td_tipo_endereco_id_tipo_endereco,
	tb_bairro_id_bairro)
VALUES (
	cep_endereco_usuario,
	numero_endereco_usuario,
	complemento_endereco_usuario,
	(SELECT id_tipo_endereco FROM td_tipo_endereco
	 WHERE tipo_endereco=tipo_endereco_usuario),
	(SELECT id_bairro FROM tb_bairro
	 WHERE bairro=bairro_usuario));


-- sexo é unico. Pode dar problema
INSERT INTO td_sexo (
    sexo )
VALUES (
    sexo_usuario);


INSERT INTO tb_dados (
    nome,
    cpf_cnpj,
    td_sexo_id_sexo)
VALUES (
    nome_usuario,
    cpf_cnpj_usuario,
    (SELECT id_sexo FROM td_sexo
    WHERE sexo=sexo_usuario));


INSERT INTO ta_moradia (
    tb_dados_id_dados,
    tb_endereco_id_endereco)
VALUES (
    (SELECT id_dados FROM tb_dados
     WHERE nome=nome_usuario AND cpf_cnpj=cpf_cnpj_usuario ),
    (SELECT id_endereco FROM tb_endereco
     WHERE cep=cep_endereco_usuario AND numero=numero_endereco_usuario ));


-- tipo_email é unico. Pode dar problema
INSERT INTO td_tipo_email (
	tipo_email )
VALUES (
    tipo_email_usuario);


INSERT INTO tb_email (
    email,
    tb_dados_id_dados,
    td_tipo_email_id_tipo_email)
VALUES (
    email_usuario,
    (SELECT id_dados FROM tb_dados
     WHERE nome=nome_usuario AND cpf_cnpj=cpf_cnpj_usuario ),
    (SELECT id_tipo_email FROM td_tipo_email
     WHERE tipo_email=tipo_email_usuario));


-- tipo_telefone é unico. Pode dar problema
INSERT INTO td_tipo_telefone (
    tipo_telefone )
VALUES (
    tipo_telefone_usuario);


INSERT INTO tb_telefone (
    telefone,
    tb_dados_id_dados,
    td_tipo_telefone_id_tipo_telefone)
VALUES (
    telefone_usuario,
    (SELECT id_dados FROM tb_dados
     WHERE nome=nome_usuario AND cpf_cnpj=cpf_cnpj_usuario ),
    (SELECT id_tipo_telefone FROM td_tipo_telefone
     WHERE tipo_telefone = tipo_telefone_usuario));


-- tipo_usuario é unico. Pode dar problema
INSERT INTO td_tipo_usuario (
    tipo_usuario)
VALUES (
    tipo_usuario_usuario);


INSERT INTO tb_usuario (
    login,
    senha,
    ativo,
    td_tipo_usuario_id_tipo_usuario,
    tb_dados_id_dados)
VALUES (
    login_usuario,
    senha_usuario,
    1, -- True? true? 'true'?
    (SELECT id_tipo_usuario FROM td_tipo_usuario
     WHERE tipo_usuario = tipo_usuario_usuario),
    (SELECT id_dados FROM tb_dados
     WHERE nome=nome_usuario AND cpf_cnpj=cpf_cnpj_usuario ));

