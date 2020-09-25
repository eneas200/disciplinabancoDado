/*
	obs: Essa ativida, se for inserir novos registro deve ser feita a modificação dos doados.
*/

-- inserindo sem dependencias
insert into pessoa(codigo_pessoa, nome_pessoa, telefone_pessoa,ano_nascimento,sexo, email, rg_pessoa) 
values 
(default, 'Jose Santos', "(98)91111-5555", '1958-05-26', 'M', "josesantos@gmail.com", '15.655.856-98'),
(default, 'Rafaela Santos', "(25)95498-1235", '1957-01-10', 'F', "rafaelasantos@gmail.com", '12.622.346-68'),
(default, 'Josias Lima', "(89)95689-0025", '1950-10-06', 'M', "josiaslima@gmail.com", '11.532.836-22');

-- cliente
insert into pessoa(codigo_pessoa, nome_pessoa, telefone_pessoa,ano_nascimento,sexo, email, rg_pessoa) 
values 
(default, 'Ana Oliveira', "(58)98532-2312", '1978-12-18', 'M', "anafsa@gmail.com", '28.814.225-1');

-- inserindo com dependencias
-- tabela fornecedor
insert into fornecedor (codigo_fornecedor, empresa, cnpj, ramo_atuacao, cargo_fornecedor, fk_chave_pessoa) 
values
(default, 'Marata', '42.373.556/0001-73', 'alimentos','financeiro', '10'),
(default, 'Marata', '42.373.556/0001-73', 'alimentos','entregador', '9');

-- tabela funcionario
desc funcionario;
insert into funcionario (codigo_funcionario, cargo, setor, salario, fk_pessoa)
values (default, 'direito', 'administrativo', '5940.85', '8');

-- tabela endereco
insert into endereco(codigo_endereco, endereco_rua, endereco_numero, endereco_bairro, complemento, cep, nacionalidade) 
values (default, 'rua A', '253', 'kalilandia', 'proxima a praça', '44620-970', 'brasileiro');

-- tabela estado
insert into estado (codigo_estado, nome_estado, nome_cidade, nome_pais, fk_codigo_endereco) values
(default, 'BA', 'Baixa Grande', 'brasil', '1');

-- cliente
insert into cliente (codigo_cliente, fk_c_pessoa) values (default, '11'); 

-- pedido
insert into pedido(codigo_pedido, nome, numero, unidade, preco,fk_codigo_cliente) 
values(default, 'notbook dell', '2653', '2', '3999.33', '1');

-- produto
insert into produto (codigo_produto, numero, nome, preco, unidade, fk_c_funcionario) 
values (default, '2653', 'notbook dell', '3999.33','10', '1');

desc venda;
-- cliente 
insert into venda(codigo_venda, preco, unidade, fk_chave_funcionario) values (default, '3999.33', '1', '1');

select * from pessoa;
select * from funcionario;
select * from fornecedor;
select * from endereco;
select * from estado;
select * from cliente;
select * from pedido;
select * from produto;
select * from venda;

-- inserção de pendencia multipla
-- pessoa_endereco
insert into pessoa_endereco (fk_cd_pessoa, fk_codigo_endereco) 
values ('10','2'), ('11','2');
select * from pessoa_endereco;

-- fornecedor_endereco
insert into fornecedor_endereco (fk_codigo_fornecedor, fk_codigo_endereco) 
values ('2', '1'), ('3', '3');
 select * from fornecedor_endereco;
 
-- tabela produto_venda
insert into produto_venda (fk_codigo_produto, fk_codigo_venda) 
values ('1', '2');
select * from produto_venda ;

-- tabela pedido_produto
select * from pedido_produto;
insert into pedido_produto (fk_codigo_pedido, fk_codigo_produto) 
values ('3', '1');

-- tabela funcionario_cliente
insert into funcionario_cliente (fk_cod_funcionario, fk_codigo_cliente) 
values ('1', '1'); 
select * from funcionario_cliente;


select * from pessoa;
select * from endereco;
select * from pessoa_endereco;
select * from pessoa_endereco as pe
join pessoa as p on pe.fk_cd_pessoa = p. codigo_pessoa
join endereco as e on pe.fk_codigo_endereco = e.codigo_endereco;














