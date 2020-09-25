/*
 
create database livros;
use livros;

create table livros.livraria (
	id_livraria int not null auto_increment,
    nome varchar(255),
    primary key(id_livraria)
);

create table livros.afilial (
	id_afilial int not null auto_increment,
    codigo_livraria int not null,
    primary key(id_afilial),
    constraint fk_codigo_livraria 
    foreign key(codigo_livraria) references livraria(id_livraria)
);
create table autor (
	id_autor int not null auto_increment,
    arte_criacao varchar(255),
    cod_livraria int not null,
    primary key(id_autor),
    constraint fk_cod_livraria
    foreign key(cod_livraria) references livraria(id_livraria)
);

 
insert into livraria (id_livraria, nome) values (default, 'A praça é nossa');
insert into afilial (id_afilial, id_livraria) values (default, '3');
select * from livraria;
select * from afilial;
*/
