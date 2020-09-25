create database comerciodb;

use comerciodb;

create table pessoa 
 (
	codigo_pess int not null auto_increment,
	nome_pessoa varchar(150) not null,
	telefone_pessoa varchar(15) not null,
    ano_nascimento date not null,
    sexo enum('F', 'M') not null,
    email varchar(255) not null,
    rg_pessoa varchar(25) not null,
    primary key(codigo_pess)
 );

create table endereco
(
	codigo_end int not null auto_increment,
	endereco_rua varchar(150) not null,
    endereco_numero varchar(100) not null,
    endereco_bairro varchar(100) not null,
    complemento varchar(255) not null,
    cep varchar(25) not null,
    nacionalida varchar(255) not null,    
	primary key(codigo_end)
);

create table estado
(
	codigo_est int not null auto_increment,
    nome_estado varchar(255) not null,
    nome_cidade varchar(255) not null,
    nome_pais varchar(255) not null,
    primary key(codigo_est)
);

create table fornecedor
(
	codigo_forn int not null auto_increment,
	empresa varchar(255) not null,
    cnpj varchar(150) not null,
    ramo_atuacao varchar(255) not null,
    cargo_fornecedor varchar(255) not null,
    primary key(codigo_forn)
);

create table funcionario
(
	codigo_func int not null auto_increment,
	cargo varchar(255) not null,
	setor varchar(255) not null,
	salario decimal(5,2),
	primary key(codigo_func) 
);

create table pedido
(
	codigo_ped int not null auto_increment,
	nome varchar(255) not null,
    numero varchar(150) not null,
    unidade int not null,
    preco decimal(5,3) not null,
    primary key(codigo_ped)
);

create table venda
(
	codigo_vend int not null auto_increment,
	preco decimal(5,3),
    unidade int,
    primary key(codigo_vend)
);

create table produto
(
	codigo_prod int not null auto_increment,
    numero varchar(100) not null,
    nome varchar(255) not null,
    preco decimal(5,2) not null,
    unidade int not null,
    primary key(codigo_prod)
);

-- ADICONANDO RELACIONAMENTO 1:N NAS ENTIDADE
-- tabela cliente
create table cliente (
	codigo_cliente int not null auto_increment,
    primary key(codigo_cliente)
);

alter table cliente
add column codigo_pess int;

alter table cliente
add constraint codigo_pess
foreign key(codigo_pess) references pessoa(codigo_pess);

-- tabela estado
alter table estado
add codigo_end int not null;

alter table estado
add constraint codigo_end
foreign key(codigo_end) references endereco(codigo_end);

-- tabela pedido
alter table pedido
add column codigo_cliente int not null;

alter table pedido
add constraint codigo_cliente
foreign key(codigo_cliente) references cliente(codigo_cliente);

-- tabela funcionario
alter table funcionario
add codigo_p int not null;

alter table funcionario
add constraint codigo_p
foreign key(codigo_p) references pessoa(codigo_pess);

-- tabela produto
alter table produto
add column codigo_forn int not null;

alter table produto
add constraint codigo_func
foreign key(codigo_func) references funcionario(codigo_func);

-- tabela venda 
alter table venda
add codigo_func int not null;

alter table venda 
add constraint codigo_f
foreign key(codigo_f) references funcionario(codigo_func);


-- tabela fornecedor
alter table fornecedor
add column fk_pessoa int not null;

alter table fornecedor
add constraint fk_pessoa
foreign key(fk_pessoa) references pessoa(codigo_pess);


-- CRIANDO TABELAS DE RELACIONAMENTO N:M

create table pessoa_endereco(
	codigo_pessoa int not null,
    codigo_endereco int not null,
    foreign key(codigo_pessoa) references  pessoa(codigo_pess),
    foreign key(codigo_endereco) references endereco(codigo_end)
);

create table fornecedor_endereco 
(
	codigo_forn int not null,
	codigo_end int not null,
    foreign key(codigo_forn) references fornecedor(codigo_forn),
    foreign key(codigo_end) references endereco(codigo_end)
);

create table funcionario_cliente
(
	codigo_fonc int not null ,
	codgio_cliente int not null,
	foreign key(codigo_fonc) references fornecedor(codigo_forn),
	foreign key(codgio_cliente) references cliente(codigo_cliente)
);

create table pedido_produto
(
	codigo_ped int not null,
	codigo_prod int not null,
	foreign key(codigo_ped) references pedido(codigo_ped),
	foreign key(codigo_prod) references produto(codigo_prod)
);

create table produto_venda
(
	codigo_prod int not null,
	codigo_vend int not null,
	foreign key(codigo_prod) references produto(codigo_prod),
	foreign key(codigo_vend) references venda(codigo_vend)
);






