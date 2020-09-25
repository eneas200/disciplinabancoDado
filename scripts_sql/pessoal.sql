-- criando um database
create database comercodb;
-- usando o database
use comerciodb;
-- criando tabela pessoa
 create table comerciodb.pessoa 
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

select * from pessoa
