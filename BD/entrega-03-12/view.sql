CREATE VIEW Vendas(ean,cat,ano,trimestre,mes, dia_mes, dia_semana,unidades,distrito,concelho) AS
    SELECT p.ean, cat, EXTRACT (YEAR FROM r.instante),  
        EXTRACT (QUARTER FROM r.instante),EXTRACT (MONTH FROM r.instante),
        EXTRACT (DAY FROM r.instante),EXTRACT (WEEK FROM r.instante),r.unidades,distrito, concelho
    FROM produto p
    INNER JOIN categoria c
    ON p.cat = c.nome
    INNER JOIN evento_reposicao r
    ON r.ean = p.ean
    NATURAL JOIN instalada_em i
    INNER JOIN ponto_de_retalho l
    ON i.local = l.nome;
    