
create database livrariabc;

use librariabc;

-- 1º tabela livraria
CREATE TABLE livraria (
  id_livraria int(11) NOT NULL AUTO_INCREMENT,
  nome varchar(45) NOT NULL,
  email varchar(255) NOT NULL,
  ano_fundacao date NOT NULL,
  estado varchar(150) NOT NULL,
  cidade varchar(150) NOT NULL,
  bairro varchar(150) NOT NULL,
  PRIMARY KEY (id_livraria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2º tabela afilial 
 create table afilial (
 	id_afilial int not null auto_increment,
 	tipo_afilial varchar(255) not null,
 	ano_fundacao DATE not null,
	f_cod_livraria int,
 	primary key (id_afilial),
	constraint fk_cod_livraria foreign key(f_cod_livraria)
	references livraria(id_livraria)
 );
 
 -- 3º tabela pessoa_livraria
create table pessoa_livraria (
	id_pessoa_livraria int not null auto_increment,
	nome varchar(255) not null,
	cpf varchar(20) not null,
	email varchar(255) not null,
	data_nascimento DATE not null,
	telefone varchar(25) not null,
	rg varchar(20) not null,
	data_cadastro DATE not null,
    f_id_livraria int,
    primary key(id_pessoa_livraria),
    constraint fk_id_livraria foreign key(f_id_livraria) 
	references livraria(id_livraria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4º tabela atendente
create table atendente(
	id_atendente int not null auto_increment,
	setor varchar(150) not null,
	salario decimal(8,2) not null,
	f_cod_pessoa_livraria int,
	primary key(id_atendente),
	constraint fk_cod_pessoa_livraria foreign key(f_cod_pessoa_livraria) 
	references pessoa_livraria(id_pessoa_livraria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error Code: 1072. Key column 'id_atendente' doesn't exist in table


-- 5º tabela cliente
create table cliente (
	id_cliente int not null auto_increment,
	necessidade varchar(255) not null,
	satisfacao varchar(5) not null,
	desconto varchar(5) not null,
	f_cod_atendente int,
	primary key(id_cliente),
	constraint fk_id_atendente 
	foreign key(f_cod_atendente) references atendente(id_atendente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6º tabela venda
create table venda (
	id_venda int not null auto_increment,
	numero_artigo varchar(10) not null,
	quantidade int not null,
	custo_final decimal(5,2) not null,
	f_id_cliente int,
	primary key(id_venda),
	constraint fk_id_cliente foreign key(f_id_cliente) 
    references cliente(id_cliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error Code: 1005. Can't create table `livraria_boco`.`venda` (errno: 150 "Foreign key constraint is incorrectly formed")

-- 7º tabela artigo
create table artigo (
	id_artigo int not null auto_increment,
	tema varchar(255) not null, 
	assunto text not null,
	data_publicacao DATE not null,
	author varchar(45) not null,
	numero_artigo varchar(10) not null,
    primary key(id_artigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 8º tabela chamada_cliente
create table chamada_cliente (
	f_cliente int not null,
	f_artigo int not null,
	constraint fk_cliente 
	foreign key(f_cliente) references cliente(id_cliente),
	constraint fk_artigo 
	foreign key(f_artigo) references artigo(id_artigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 9º tabela produto
create table produto (
	id_produto int not null auto_increment,
	assunto varchar(255) not null,
	preco decimal(5,2) not null,
    numero_artigo varchar(10) not null,
	primary key(id_produto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error Code: 1005. Can't create table `livraria_boco`.`promocoes` (errno: 150 "Foreign key constraint is incorrectly formed")

-- 10º tabela promocoes
create table promocoes (
	id_promocoes int not null auto_increment,
	periodo_inicial DATETIME not null,
	periodo_final DATETIME not null,
	descricao text not null,
    custo_temporario decimal(5,2) not null,
	codigo_produto int not null,
	primary key(id_promocoes),
	constraint fk_codigo_produto 
	foreign key(codigo_produto) references produto(id_produto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 11 tabela artigo_produto
create table artigo_produto (
	f_cod_artigo int not null,
	f_cod_produto int not null,
	constraint fk_cod_artigo
	foreign key(f_cod_artigo) references artigo(id_artigo),
	constraint fk_cod_produto
	foreign key(f_cod_produto) references produto(id_produto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- exibição das entidade cliadas
show tables;



INSERT INTO `livraria` (`id_livraria`, `nome`, `email`, `ano_fundacao`, `estado`, `cidade`, `bairro`) 
VALUES (default, 'Praca brasil', 'pracabrasil@gmail.com', '1958-01-10', 'BA', 'Salvador', 'Cajazeira 9');

--
-- Extraindo dados da tabela `afilial`
--

INSERT INTO `afilial` (`id_afilial`, `tipo_afilial`, `ano_fundacao`, `f_cod_livraria`) VALUES
(default, 'fisica', '2020-05-10', 1);

--
-- Extraindo dados da tabela `pessoa_livraria`
--

INSERT INTO `pessoa_livraria` (`id_pessoa_livraria`, `nome`, `cpf`, `rg`, `telefone`, `email`, `data_nascimento`, `data_cadastro`, `f_id_livraria`) VALUES
(default, 'Jukinha', '652.654.985-66', '15.652.654-98', '6666-9999', 'juka@hotmail.com', '1999-05-29', '2020-09-18', 1),
(default, 'Jose', '123.569.958-99', '12.546.458-58', '1111-2222', 'jose@gmail.com', '1985-09-25', '2020-09-19', 1),
(default, 'Maria Santo', '555.666.887-89', '17.568.654-98', '8798-5664', 'mariasanto@gmail.com', '1978-04-14', '2020-09-19', 1),
(default, 'joao', '456.321.565-45', '52.563.258-56', '1232-6545', 'joao@hotmail.com', '1993-02-08', '2020-09-19', 1),
(default, 'Rafaela', '258.654.753-98', '65.456.879-45', '3215-5698', 'rafaela@gmail.com', '1986-09-07', '2020-09-19', 1);



--
-- Extraindo dados da tabela `artigo`
--

INSERT INTO `artigo` (`id_artigo`, `tema`, `assunto`, `data_publicacao`, `author`, `numero_artigo`) VALUES
(default, '10 Lingagem mais utulizadas na web', 'Tecnologia', '2015-11-20', 'Rei Pele', 'T659845'),
(default, 'Embalagens de presentes', 'Papelaria', '2019-12-29', 'Joé', 'P32659847'),
(default, 'Novos processador Geração 10', 'Informatica', '2020-02-05', 'Xerox', 'I153562984'),
(default, 'Linguagens menos utilizada no mercado', 'Tecnologia', '2020-06-15', 'Japão', 'T55448877'),
(default, 'Microsoft lança curso de logica da programação', 'Tecnologia', '2020-08-12', 'Bill gates', 'T862159357'),
(default, 'Papelaria e escritorio', 'Papelaria', '2019-05-25', 'amazon', 'P568945870'),
(default, 'Papelaria | Saraiva', 'Papelaria', '2020-03-30', 'Saraiva', 'P562315265');


--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `assunto`, `preco`, `numero_artigo`) VALUES
(default, 'Tecnologia', '29.65', 'T659845'),
(default, 'Papelaria', '6.99', 'P32659847'),
(default, 'Informatica', '59.85', 'I153562984'),
(default, 'Tecnologia', '20.99', 'T55448877'),
(default, 'Tecnologia', '9.99', 'T862159357'),
(default, 'Papelaria', '18.98', 'P568945870'),
(default, 'Papelaria', '35.58', 'P562315265'),
(default, 'Papelaria', '40.12', 'P225588990'),
(default, 'Informatica', '15.89', 'I564321569'),
(default, 'Informatica', '20.99', 'I564898562');

--
-- Extraindo dados da tabela `artigo_produto`
--

INSERT INTO `artigo_produto` (`f_cod_artigo`, `f_cod_produto`) VALUES
(1, 1),
(3, 3);

--
-- Extraindo dados da tabela `atendente`
--

INSERT INTO `atendente` (`id_atendente`, `setor`, `salario`, `f_cod_pessoa_livraria`) VALUES
(default, 'vendas', '1089.00', 3),
(default, 'entregas', '1200.32', 5);

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `necessidade`, `satisfacao`, `desconto`, `f_cod_atendente`) VALUES
(default, 'comprar embalagem para presentes', '50%', '0.01%', 1),
(default, 'comprar artigo sobre tecnologia', '95%', '0.10%', 1),
(default, 'comprar embalagem de presente', '85%', '0.00%', 1),
(default, 'comprar artigo de cursos de tecnologia', '80%', '1.00%', 1),
(default, 'comprar emablagens de presentes infantil', '90%', '0.00%', 1);

--
-- Extraindo dados da tabela `CHAMADA_CLIENTE
--

insert into chamada_cliente (f_cliente, f_artigo) 
value (1,2), (2,1), (3,3), (4,4),(5,5);



--
-- Extraindo dados da tabela `promocoes`
--

INSERT INTO `promocoes` (`id_promocoes`, `periodo_inicial`, `periodo_final`, `descricao`, `custo_temporario`, `codigo_produto`) VALUES
(default, '2020-09-19 00:00:00', '2020-09-28 00:00:00', 'grande sladão de preços baixo para artigos no mês de Setmbro', '19.99', 1),
(default, '2020-09-19 00:00:00', '2020-09-28 00:00:00', 'grande saldão de artigo mais selecionados', '6.92', 1),
(default, '0000-00-00 00:00:00', '2020-09-28 00:00:00', 'Os artigos mais comprado da nossa loja em  10 % de descontro', '10.00', 4);

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id_venda`, `numero_artigo`, `quantidade`, `custo_final`, `f_id_cliente`) VALUES
(default, 'T659845', 1, '26.68', 2),
(default, 'P32659847', 1, '6.93', 1),
(default, 'I153562984', 1, '59.85', 3),
(default, 'T862159357', 1, '9.99', 4),
(default, 'P562315265', '1', '35.58', '5');
COMMIT;


-- ----------------------------
-- RELATÓRIO 
-- ----------------------------

select cc.*, c.satisfacao, a.tema, a.assunto, a.author from chamada_cliente as cc
join cliente as c on cc.f_cliente = c.id_cliente
join artigo as a on cc.f_artigo = a.id_artigo;

SELECT v.numero_artigo, v.quantidade, v.custo_final, c.necessidade, c.satisfacao, c.desconto  FROM venda  as v
join cliente as c on v.f_id_cliente = c.id_cliente;

 


