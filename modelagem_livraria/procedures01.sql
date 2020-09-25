use livrariadb;
  

/*
livraria(id_livraria, nome, email, ano_fundacao, estado, cidade, bairro) OK
	INSERT INTO livraria (id_livraria, nome, email, ano_fundacao, estado, cidade, bairro) 
	VALUES (DEFAULT, 'Duex', 'duexoficial@gmail.com', '1999-02-30', 'BH', 'Belo Horizonte', "Avenida Brasil");
	UPDATE livraria SET nome = "Duex Mix"  WHERE id_livraria = 2;
	DELETE FROM livraria WHERE id_livraria = 10;
	CALL PROC_INSERT_LIVRARIA('Duex', 'duexoficial@gmail.com', '1999-02-30', 'BH', 'Belo Horizonte', "Avenida Brasil");
	CALL PROC_UPDATE_LIVRARIA(3, '1989-02-03');
	CALL PROC_SELECT_LIVRARIA();
	CALL PROC_DEL_LIVRARIA(7);


afilial(id_afilial, tipo_afilial, ano_fundacao, f_cod_livraria) OK
	SELECT * FROM afilial;
	INSERT INTO afilial (id_afilial, tipo_afilial, ano_fundacao, f_cod_livraria) 
	VALUES (DEFAULT, 'WEB SITE', '1965-05-18', '1');
	UPDATE afilial SET tipo_afilial = 'LOJA VIRTUAL(BLOG)'  WHERE 1 = 1;
	DELETE FROM afilial WHERE id_afilial = 2;
	CALL PROC_SELECTALL_AFILIAL();
	CALL PROC_DEL_AFILIAL(2);
	CALL PROC_UPDATE_AFILIAL(1, 'LOJA VIRTUAL(BLOG)');
	CALL PROC_INSERT_AFILIAL('WEB SITE', '2020-09-22', '1');

pessoa_livraria OK

atendente(id_atendente,setor, salario, f_cod_pessoa_livraria) NAO OK
SELECT * FROM atendente;
INSERT INTO atendente (id_atendente,setor, salario, f_cod_pessoa_livraria) 
VALUES (DEFAULT, 'caixa', '2500.21', 12);
UPDATE atendente SET setor = "finanças"  WHERE id_atendente = 3;
DELETE FROM atendente WHERE id_atendente = 3;
CALL PROC_INSERT_ATENDENTE('caixa', '2500.21', 12);
CALL PROC_UPDATE_ATENDENTE(3, 'finanças');
CALL PROC_SELECTALL_ATENDENTE();
CALL PROC_DEL_ATENDENTE(3);

cliente(id_cliente, necessidade, satisfacao, desconto, f_cod_atendente) OK
SELECT * FROM cliente;
INSERT INTO cliente (id_cliente, necessidade, satisfacao, desconto, f_cod_atendente) 
VALUES (default, 'compra artigo pesquisas sobre notbook', '58%', '0.30%','1');
UPDATE cliente SET satisfacao = '45%', desconto = '0.20%'  WHERE id_cliente = 1;
DELETE FROM cliente WHERE id_cliente = 1;
CALL PROC_INSERT_CLIENTE('compra artigo pesquisas sobre notbook', '58%', '0.30%','1');
CALL PROC_UPDATE_CLIENTE(7, '45%', '0.20%');
CALL PROC_SELECTALL_CLIENTE();
CALL PROC_DEL_CLIENTE(7);
=======================================================================


venda(id_venda, numero_artigo, quantidade, custo_final, f_id_cliente) NAO OK
SELECT * FROM venda;
INSERT INTO venda(id_venda, numero_artigo, quantidade, custo_final, f_id_cliente) 
VALUES (default, 'I153562984', 15, '19.99', 7);
UPDATE venda SET numero_artigo = 'T862159357'  WHERE id_venda = 5;
DELETE FROM produto WHERE id_venda = 7;
CALL PROC_INSERT_VENDA('I153562984', 15, '19.99', 7);
CALL PROC_UPDATE_VENDA(6, 'P234567891');
CALL PROC_SELECTALL_VENDA();
CALL PROC_DEL_VENDA(5);
=======================================================================

artigo(id_artigo, tema, assunto, data_publicacao, author, numero_artigo) NAO OK
SELECT * FROM artigo;
INSERT INTO artigo() VALUES ();
UPDATE artigo SET Z = 1  WHERE 1 = 1;
DELETE FROM artigo WHERE 1 = 1;
CALL PROC_INSERT_ARTIGO()
CALL 
PROC_UPDATE_ARTIGO()
CALL PROC_SELECTALL_ARTIGO()
CALL PROC_DEL_ARTIGO()
=======================================================================

chamada_cliente(f_cliente, f_artigo) NAO OK
SELECT * FROM chamada_cliente;
INSERT INTO chamada_cliente (f_cliente, f_artigo)
VALUES (2, 5);
UPDATE chamada_cliente SET f_cliente = 5  WHERE f_artigo = 10;
DELETE FROM chamada_cliente WHERE 1 = 1;
CALL PROC_INSERT_CHAMADA_CLIENTE(5, 9);
CALL PROC_UPDATE_CHAMADA_CLIENTE(5,8);
CALL PROC_SELECTALL_CHAMADA_CLIENTE();
CALL PROC_DEL_CHAMADA_CLIENTE(5);
=======================================================================

produto(id_produto, assunto, preco, numero_artigo) OK
	SELECT * FROM produto;
	INSERT INTO produto (id_produto, assunto, preco, numero_artigo) 
	VALUES (default,'Papelaria','15', 'P56486523');
	UPDATE produto SET Z = 1  WHERE 1 = 1;
	DELETE FROM produto WHERE 1 = 1;
	CALL PROC_INSERT_PRODUTO('Papelaria','15', 'P56486523');
	CALL PROC_UPDATE_PRODUTO(12, "Papelaria", '10.99');
	CALL PROC_SELECTALL_PRODUTO();
	CALL PROC_DEL_PRODUTO(10);
=======================================================================

promocoes(id_promocoes, periodo_incial, periodo_final, descricao, custo_temporario, codigo_produto) NAO OK
SELECT * FROM promocoes;
INSERT INTO promocoes (id_promocoes, periodo_inicial, periodo_final, descricao, custo_temporario, codigo_produto) 
VALUES (default, '2020-09-22', '2020-09-25', 'saldão de desconto', '10.99', '3');
UPDATE promocoes SET periodo_inicial = '2020-09-26', periodo_final = '2020-09-30'  WHERE id_promocoes = 4;
DELETE FROM promocoes WHERE 1 = 1;
CALL PROC_INSERT_PROMOCOES('2020-09-22', '2020-09-25', 'saldão de desconto', '10.99', '3');
CALL PROC_UPDATE_PROMOCOES(3, '2020-09-02', '2020-09-10');
CALL PROC_SELECTALL_PROMOCOES();
CALL PROC_DEL_PROMOCOES(4);


artigo_produto(f_cod_artigo, f_cod_produto) OK
	SELECT * FROM artigo_produto;
	INSERT INTO artigo_produto () VALUES ();
	UPDATE artigo_produto SET Z = 1  WHERE 1 = 1;
	DELETE FROM artigo_produto WHERE 1 = 1;
	CALL PROC_INSERT_ARTIGO_PRODUTO(9, 1);
	CALL PROC_UPDATE_ARTIGO_PRODUTO(3, 3);
	CALL PROC_SELECTALL_ARTIGO_PRODUTO();
	CALL PROC_DEL_ARTIGO_PRODUTO(3);
=======================================================================    
*/
