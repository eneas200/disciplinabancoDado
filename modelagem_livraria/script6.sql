use livrariadb;
select * from afilial join livraria on afilial.f_cod_livraria = livraria.id_livraria;
select * from livraria;
select * from pessoa_livraria;
select pl.nome, pl.cpf, pl.rg, pl.email, pl.telefone,l.bairro, l.nome, l.cidade from pessoa_livraria as pl 
join livraria as l on pl.f_id_livraria = l.id_livraria;
select * from artigo;
select * from produto;
select * from artigo_produto;
select * from artigo_produto as ap 
join artigo as a on ap.f_cod_artigo = a.id_artigo and assunto = "Papelaria"
join produto as p on ap.f_cod_produto = p.id_produto;
 
select * from promocoes;
desc promocoes;
select * from produto;
select * from venda;
select * from artigo where numero_artigo = 'T862159357';
select * from produto ;
desc venda;
desc cliente;
select * from cliente;
-- numero do produto tecnologia T659845 custo 29.65 com desconto de 0.10%
-- numero do produto papelaria P32659847 custo 6.99 com desconto de 0.01%
-- numero do produto papelaria I153562984 custo 59.85 com desconto de 0.01%
-- microsoft T862159357 Tecnologia
-- amazon Papelaria P568945870
-- saraiva Papelaria P562315265


select sum(custo_final) as "Valor final do caixa", avg(custo_final) as "A média é" from venda;



