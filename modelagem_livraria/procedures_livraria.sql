 DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_AFILIAL`(
	IN id INT
)
BEGIN
	DELETE FROM afilial WHERE id_afilial = id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_ARTIGO`(IN idArtigo INT)
BEGIN
	delete from artigo where id_artigo = idArtigo;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_ARTIGO_PRODUTO`(in id int)
BEGIN
	delete from artigo_produto where f_cod_artigo = id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_ATENDENTE`(
	IN idAtendente INT
)
BEGIN
	DELETE FROM atendente WHERE id_atendente = idAtendente;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_CHAMADA_CLIENTE`(
	in	identificador int
)
BEGIN
	delete from chamada_cliente 
    where f_cliente = identificador
    LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_CLIENTE`(
	IN idcliente INT
)
BEGIN
	DELETE FROM cliente WHERE id_cliente = idcliente;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_LIVRARIA`(IN id INT)
BEGIN
	DELETE FROM livraria WHERE id_livraria = id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_PESSOA_LIVRARIA`(
	IN id INT)
BEGIN
	delete from pessoa_livraria where id_pessoa_livraria = id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_PRODUTO`(
		in idproduto int
)
BEGIN
	delete from produto where id_produto = idproduto;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_PROMOCOES`(	IN idpromocoes INT )
BEGIN
	DELETE FROM promocoes WHERE id_promocoes = idpromocoes;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_DEL_VENDA`(
	IN idvenda INT
)
BEGIN
	delete from venda 
    where id_venda = idvenda
    limit 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_AFILIAL`(
    IN tipo VARCHAR(255),
    IN anoFundacao DATE,
    in fk_livraria int
)
BEGIN
	INSERT INTO afilial (id_afilial, tipo_afilial, ano_fundacao, f_cod_livraria) 
	VALUES (DEFAULT, tipo, anoFundacao, fk_livraria);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_ARTIGO`(
	IN tema varchar(255),
	IN assunto text,
	IN datapublicacao date,
	IN autor varchar(45),
	IN numeroartigo varchar(10)
)
BEGIN
	
	INSERT INTO artigo(id_artigo, tema, assunto, data_publicacao, author, numero_artigo)
	VALUES (default, tema, assunto, datapublicacao, autor, numeroartigo);

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_ARTIGO_PRODUTO`(
	IN f_artigo_produto INT,
    IN f_cod_produto INT
)
BEGIN
	INSERT INTO artigo_produto (f_cod_artigo, f_cod_produto) 
	VALUES (f_artigo_produto, f_cod_produto);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_ATENDENTE`(
    IN setor varchar(255),
    IN salario DECIMAL(8,2),
    IN fk_pessoa_livraria int
)
BEGIN
	INSERT INTO atendente (id_atendente, setor, salario, f_cod_pessoa_livraria) 
	VALUES (DEFAULT, setor, salario, fk_pessoa_livraria);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_CHAMADA_CLIENTE`(
	in fk_cliente int,
	in fk_artigo int
)
BEGIN
	INSERT INTO chamada_cliente (f_cliente, f_artigo)
	VALUES (fk_cliente, fk_artigo);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_CLIENTE`(
	IN necessidade varchar(255),
	IN satisfacao varchar(10),
	IN desconto varchar(10),
	IN fCodAtendente int
)
BEGIN
	INSERT INTO cliente (id_cliente, necessidade, satisfacao, desconto, f_cod_atendente) 
	VALUES (default, necessidade, satisfacao, desconto, fCodAtendente);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_LIVRARIA`(
    IN nome VARCHAR(45),
    IN email VARCHAR(255),
    IN anoFundacao DATE, 
    IN estado VARCHAR(150), 
    IN cidade VARCHAR(150), 
    IN bairro VARCHAR(150)
)
BEGIN
	INSERT INTO livraria (id_livraria, nome, email, ano_fundacao, estado, cidade, bairro) 
	VALUES (DEFAULT, nome, email, anoFundacao, estado, cidade, bairro);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_PESSOA_LIVRARIA`(
	IN livraria_nome VARCHAR(255),
	IN livraria_cpf VARCHAR(20),
	IN livraria_rg VARCHAR(20),
	IN livraria_telefone VARCHAR(45),
	IN livraria_email VARCHAR(255),
	IN livraria_data_nascimento DATE,
	IN livraria_data_cadastro DATE,
	IN f_id_livraria INT
)
BEGIN
	INSERT INTO pessoa_livraria (`id_pessoa_livraria`, `nome`, `cpf`, `rg`,`telefone`, `email`, `data_nascimento`, `data_cadastro`, `f_id_livraria`) 
    VALUES (default, livraria_nome, livraria_cpf, livraria_rg, livraria_telefone, livraria_email, livraria_data_nascimento, livraria_data_cadastro, f_id_livraria);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_PRODUTO`(
	in tema varchar(255),
	in valor decimal(5,2),
	in numeroArtigo varchar(10)
)
BEGIN
	INSERT INTO produto (id_produto, assunto, preco, numero_artigo) 
	VALUES (default, tema, valor, numeroArtigo);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_PROMOCOES`(
	IN periodoInicial varchar(255),
	IN periodoFinal varchar(255),
	IN descricao varchar(255),
	IN custoTemporario varchar(255),
	IN codigoProduto varchar(255)
    
)
BEGIN
	INSERT INTO promocoes (id_promocoes, periodo_inicial, periodo_final, descricao, custo_temporario, codigo_produto) 
	VALUES (default, periodoInicial, periodoFinal, descricao, custoTemporario, codigoProduto);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_VENDA`(
	IN numeroArtigo VARCHAR(10),
	IN quantidade INT,
	IN custoFinal DECIMAL(5,2),
    IN fIdCliente INT
)
BEGIN
	INSERT INTO venda(id_venda, numero_artigo, quantidade, custo_final, f_id_cliente) 
	VALUES (default, numeroArtigo, quantidade, custoFinal, fIdCliente);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECT_LIVRARIA`()
BEGIN
	SELECT * FROM livraria;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECT_PESSOA_LIVRARIA`()
BEGIN
	SELECT * FROM pessoa_Livraria
    ORDER BY id_pessoa_livraria DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECTALL_AFILIAL`()
BEGIN
	SELECT * FROM afilial;
	 /*SELECT * FROM afilial as a
     join livraria as l
     on a.f_cod_livraria = l.id_livraria;*/
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECTALL_ARTIGO`()
BEGIN
	SELECT * FROM artigo;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECTALL_ARTIGO_PRODUTO`()
BEGIN
	SELECT * FROM artigo_produto;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECTALL_ATENDENTE`()
BEGIN
	SELECT * FROM atendente;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECTALL_CHAMADA_CLIENTE`()
BEGIN
	SELECT * FROM chamada_cliente;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECTALL_CLIENTE`()
BEGIN
	SELECT * FROM cliente;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECTALL_PRODUTO`()
BEGIN
	SELECT * FROM produto;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECTALL_PROMOCOES`()
BEGIN
	SELECT * FROM promocoes;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SELECTALL_VENDA`()
BEGIN
	SELECT * FROM venda;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_AFILIAL`(
	IN id INT,
    IN novo_tipo VARCHAR(255)
)
BEGIN
	UPDATE afilial SET tipo_afilial = novo_tipo WHERE id_afilial = id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_ARTIGO`(
	IN artigo int,
    IN autor varchar(45)
)
BEGIN
	update artigo set tema = autor where id_artigo = artigo ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_ARTIGO_PRODUTO`(
	in id1 int,
	in id2 int
)
BEGIN
		UPDATE artigo_produto 
        set f_cod_produto = id2 
        where f_cod_artigo = id1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_ATENDENTE`(
	IN idAtendente INT,
    IN setorAtendente VARCHAR(255)
)
BEGIN
	UPDATE atendente SET setor = setorAtendente WHERE id_atendente = idAtendente;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_CHAMADA_CLIENTE`(
	in fk_cliente int,
	in fk_artigo int
)
BEGIN
	UPDATE chamada_cliente 
    SET f_artigo = fk_artigo
    WHERE f_cliente = fk_cliente
    limit 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_CLIENTE`(
	In idcliente int,
	IN satisfacao varchar(10),
	IN desconto varchar(10)
)
BEGIN
	UPDATE cliente 
    SET satisfacao = satisfacao, desconto = desconto  
    WHERE id_cliente = idcliente;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_LIVRARIA`(
	IN idlivraria INT,
    IN anofundacao DATE
)
BEGIN
	update livraria set ano_fundacao = anofundacao where id_livraria = idlivraria;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_PESSOA_LIVRARIA`(
	IN id_livraria int, 
	IN endereco_email varchar(255))
BEGIN
	update pessoa_livraria 
    set email = endereco_email
    where id_pessoa_livraria = id_livraria;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_PRODUTO`(
	in idproduto int,
	in tema varchar(255),
    in valor decimal(5,2)
)
BEGIN
	update produto 
    set assunto = tema, preco = valor
    where id_produto = idproduto;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_PROMOCOES`(
	IN idpromocoes INT,
	IN periodoInicial varchar(255),
	IN periodoFinal varchar(255)
)
BEGIN
	UPDATE promocoes 
    SET periodo_inicial = periodoInicial, periodo_final = periodoFinal 
    WHERE id_promocoes = idpromocoes;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_VENDA`(
	IN idArtigo INT,
    IN numeroArtigo VARCHAR(10)
)
BEGIN
	UPDATE venda 
    SET numero_artigo = numeroArtigo
    WHERE id_venda = idArtigo;
END$$
DELIMITER ;
