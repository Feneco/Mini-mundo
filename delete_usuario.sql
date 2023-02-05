select tb_usuario.id_usuario   as id_usuario_to_delete,
       tb_dados.id_dados       as id_dados_to_delete,
       tb_endereco.id_endereco as id_endereco_to_delete,
       tb_telefone.id_telefone as id_telefone_to_delete,
       tb_email.id_email       as id_email_to_delete
from tb_usuario
left join  tb_dados     on tb_dados.id_dados             = tb_usuario.tb_dados_id_dados
inner join ta_moradia   on tm.tb_dados_id_dados          = dados.id_dados
left join  tb_endereco  on tb_endereco.id_endereco       = ta_moradia.tb_endereco_id_endereco
left join  tb_telefone  on tb_telefone.tb_dados_id_dados = dados.id_dados
left join  tb_email     on tb_email.tb_dados_id_dados    = dados.id_dados
where tb_usuario.id_usuario = codigo_usuario;


-- Dado um codigo_usuário o select acima retorna todos os IDs necessários para fazer os delete abaixo. 
delete from ta_moradia
where tb_dados_id_dados = id_dados_to_delete and tb_endereco_id_endereco = id_endereco_to_delete;

delete from tb_endereco
where id_endereco = id_endereco_to_delete;

delete from tb_telefone
where id_telefone = id_telefone_to_delete;

delete from tb_usuario
where id_usuario = id_usuario_to_delete;

delete from tb_email
where id_email = id_email_to_delete;

delete from tb_dados
where id_dados = id_dados_to_delete;