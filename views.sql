create view info_usuario as (
	select u.id_usuario, u.login, d.nome, d.cpf_cnpj, s.sexo, t.telefone, m.email 
    from tb_usuario u
	left join tb_dados    d on u.tb_dados_id_dados = d.id_dados
	left join td_sexo     s on s.id_sexo           = d.td_sexo_id_sexo
	left join tb_telefone t on t.tb_dados_id_dados = d.id_dados
	left join tb_email    m on m.tb_dados_id_dados = d.id_dados
);


create view endereco_usuario as (
	select u.id_usuario, dados.nome, dados.cpf_cnpj, t.telefone, 
		   e.estado, c.cidade, b.bairro, 
		   endereco.cep, endereco.numero, endereco.complemento
	from tb_dados dados
    left join tb_usuario  u        on u.tb_dados_id_dados        = dados.id_dados
	left join tb_telefone t        on dados.id_dados             = t.tb_dados_id_dados
	left join ta_moradia  tm       on tm.tb_dados_id_dados       = dados.id_dados
	left join tb_endereco endereco on tm.tb_endereco_id_endereco = endereco.id_endereco
	left join tb_bairro   b        on b.id_bairro                = endereco.tb_bairro_id_bairro
	left join tb_cidade   c        on c.id_cidade                = b.tb_cidade_id_cidade
	left join tb_estado   e        on e.id_estado                = c.tb_estado_id_estado
);