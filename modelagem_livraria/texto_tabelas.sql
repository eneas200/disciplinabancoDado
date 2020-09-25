-- tabelas da atividade livraria do bocó

-- criando o banco de dados livraria_boco
-- drop database livraria_boco;
create database livrariaBoco;

use livrariaBoco;

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
create table pessoa_livraria(
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
create table cliente(
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
	nome varchar(255) not null,
	preco decimal(5,2) not null,
	primary key(id_produto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error Code: 1005. Can't create table `livraria_boco`.`promocoes` (errno: 150 "Foreign key constraint is incorrectly formed")

-- 10º tabela promocoes
create table promocoes (
	id_promocoes int not null auto_increment,
	periodo_inicial DATETIME not null,
	periodo_final DATETIME not null,
	descricao text not null,
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

show tables