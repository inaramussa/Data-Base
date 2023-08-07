--Qual o nome do retalhista (ou retalhistas) responsáveis pela reposição do maior número de categorias?
SELECT nome FROM retalhista WHERE tin IN(SELECT C.tin FROM(SELECT tin, COUNT(distinct nome_cat) FROM responsavel_por
	GROUP BY tin HAVING COUNT(distinct nome_cat) >= ALL(SELECT COUNT(distinct nome_cat) FROM responsavel_por GROUP BY tin)) AS C);

--Qual o nome do ou dos retalhistas que são responsáveis por todas as categorias simples?	
SELECT nome FROM retalhista r WHERE NOT EXISTS (SELECT nome FROM categoria_simples
	EXCEPT SELECT nome_cat FROM retalhista r2 NATURAL JOIN responsavel_por WHERE r2.nome = r.nome);

--Quais os produtos (ean) que nunca foram repostos?
SELECT ean FROM produto WHERE ean NOT IN (SELECT ean FROM evento_reposicao);

--Quais os produtos (ean) que foram repostos sempre pelo mesmo retalhista?
SELECT ean FROM evento_reposicao GROUP BY ean HAVING count(DISTINCT tin)=1;

