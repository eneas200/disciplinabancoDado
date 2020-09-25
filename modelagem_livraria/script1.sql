

/* criar um banco de dados para uma livraria
Modelagem livraria do Bocó
- o cliente solicita o desenvolvimento de um sistema web que possibilite
a venda de artigo de livraria, papelaria, informatica.

- nesse sistema. também deve ser contenplado promoçoes com códigos de descontos.

- S livraria terá mais de uma afilial e mais de un canal de venda. 
Exemplo site loja fisica

- Todas as vendas devem ser contabilizadas, ao final do mes, o setor de compras emite um relatorio
com a quantidade de itens vendidos  e quantidade de vendas

Banco
livrariadb

Tabelas:
    - pessoa_livraria(nome, data_nascimento, email, telefone, rg, cpf, data_cadastro)
	- vendas(data_venda, numero_artigo, quantidade, custo_final)
	- promocoes(datatime, produto, preco, descricao)
	- atendente(setor, cargo, salario)
	- cliente(necessidade, satisfacao, desconto)
	- artigos(tema, assunto, data_publicacao, author)
		- livraria
        - papelaria
        - informatica
	


*/