create database comerciodb;
use comerciodb;

create table pessoa 
 (
	codigo_pessoa int not null auto_increment,
	nome_pessoa varchar(150) not null,
	telefone_pessoa varchar(15) not null,
    ano_nascimento date not null,
    sexo enum('F', 'M') not null,
    email varchar(255) not null,
    rg_pessoa varchar(25) not null,
    primary key(codigo_pessoa)
 );

create table endereco
(
	codigo_endereco int not null auto_increment,
	endereco_rua varchar(150) not null,
    endereco_numero varchar(100) not null,
    endereco_bairro varchar(100) not null,
    complemento varchar(255) not null,
    cep varchar(25) not null,
    nacionalida varchar(255) not null,    
	primary key(codigo_endereco)
);

create table estado
(
	codigo_estado int not null auto_increment,
    nome_estado varchar(255) not null,
    nome_cidade varchar(255) not null,
    nome_pais varchar(255) not null,
    primary key(codigo_estado)
);

create table fornecedor
(
	codigo_fornecedor int not null auto_increment,
	empresa varchar(255) not null,
    cnpj varchar(150) not null,
    ramo_atuacao varchar(255) not null,
    cargo_fornecedor varchar(255) not null,
    primary key(codigo_fornecedor)
);

create table funcionario
(
	codigo_funcionario int not null auto_increment,
	cargo varchar(255) not null,
	setor varchar(255) not null,
	salario decimal(5,2),
	primary key(codigo_funcionario) 
);

create table pedido
(
	codigo_pedido int not null auto_increment,
	nome varchar(255) not null,
    numero varchar(150) not null,
    unidade int not null,
    preco decimal(5,3) not null,
    primary key(codigo_pedido)
);

create table venda
(
	codigo_venda int not null auto_increment,
	preco decimal(5,3),
    unidade int,
    primary key(codigo_venda)
);

create table produto
(
	codigo_produto int not null auto_increment,
    numero varchar(100) not null,
    nome varchar(255) not null,
    preco decimal(5,2) not null,
    unidade int not null,
    primary key(codigo_produto)
);

-- --------------------------------------------------------------
-- ADICONANDO RELACIONAMENTO 1:N NAS ENTIDADE
-- --------------------------------------------------------------

create table cliente (
	codigo_cliente int not null auto_increment,
    primary key(codigo_cliente)
);

alter table cliente
add column fk_c_pessoa int not null;

alter table cliente
add constraint fk_c_pessoa
foreign key(fk_c_pessoa) references pessoa(codigo_pessoa);

-- tabela estado
alter table estado
add fk_codigo_endereco int not null;

alter table estado
add constraint fk_codigo_endereco
foreign key(fk_codigo_endereco) references endereco(codigo_endereco);

-- tabela pedido
alter table pedido
add column fk_codigo_cliente int not null;

alter table pedido
add constraint fk_codigo_cliente
foreign key(fk_codigo_cliente) references cliente(codigo_cliente);

-- tabela funcionario
alter table funcionario
add fk_pessoa int not null;

alter table funcionario
add constraint fk_pessoa
foreign key(fk_pessoa) references pessoa(codigo_pessoa);

-- tabela produto
alter table produto
add column fk_c_funcionario int not null;

alter table produto
add constraint fk_c_funcionario
foreign key(fk_c_funcionario) references funcionario(codigo_funcionario);

-- tabela venda 
alter table venda
add fk_chave_funcionario int not null;

alter table venda 
add constraint fk_chave_funcionario
foreign key(fk_chave_funcionario) references funcionario(codigo_funcionario);

-- tabela fornecedor
alter table fornecedor
add column fk_chave_pessoa int not null;

alter table fornecedor
add constraint fk_chave_pessoa
foreign key(fk_chave_pessoa) references pessoa(codigo_pessoa);


-- --------------------------------------------------------------
-- CRIANDO TABELAS DE RELACIONAMENTO N:M
-- --------------------------------------------------------------


create table pessoa_endereco
(
	fk_cd_pessoa int not null,
    fk_codigo_endereco int not null,
    foreign key(fk_cd_pessoa) references  pessoa(codigo_pessoa),
    foreign key(fk_codigo_endereco) references endereco(codigo_endereco)
);

create table fornecedor_endereco 
(
	fk_codigo_fornecedor int not null,
	fk_codigo_endereco int not null,
    foreign key(fk_codigo_fornecedor) references fornecedor(codigo_fornecedor),
    foreign key(fk_codigo_endereco) references endereco(codigo_endereco)
);

create table funcionario_cliente
(
	fk_cod_funcionario int not null ,
	fk_codigo_cliente int not null,
	foreign key(fk_cod_funcionario) references funcionario(codigo_funcionario),
	foreign key(fk_codigo_cliente) references cliente(codigo_cliente)
);

create table pedido_produto
(
	fk_codigo_pedido int not null,
	fk_codigo_produto int not null,
	foreign key(fk_codigo_pedido) references pedido(codigo_pedido),
	foreign key(fk_codigo_produto) references produto(codigo_produto)
);

create table produto_venda
(
	fk_codigo_produto int not null,
	fk_codigo_venda int not null,
	foreign key(fk_codigo_produto) references produto(codigo_produto),
	foreign key(fk_codigo_venda) references venda(codigo_venda)
);

