-- descrição de tabelas e seu respectivos relacionamentos
-- banco de dados livrariaBoco
-- tabelas

/*
livraria(
	id_livraria
) {primeiro tabela a ser criada}

afilial(
	id_afilial,
	f_cod_livraria
){depende da tabela livraria}

pessoa_livraria(
	id_pessoa_livraria, 
    f_id_livraria
){dependente da tabela livraria}

atendente(
	id_atendente, 
    f_cod_pessoa_livraria
){depende da tabela pessoa_livraria}

cliente(
	id_cliente, 
    f_cod_atendente
){depende da tabela atedente}

venda(
	id_venda,
    f_id_cliente
){depende da tabela cliente}

artigo(
	id_artigo
){}

chamada_cliente(
	f_cliente,
    f_artigo
){depende das tabelas cliente e artigo}

produto(
	id_produto
){}
artigo_produto(
	f_cod_artigo,
	f_cod_produto
){ depende das tabelas artigo e produto }

promocoes(
	id_promocoes,
    f_produto
){ depende da tabela produto }


*/

