/*1)...num dado periodo(i.e. entre duas datas), por dia da semana, por concelho e no total*/
 
SELECT vendas.dia_semana,vendas.concelho, SUM(vendas.unidades)
    FROM vendas
    WHERE vendas.ano BETWEEN 2019 AND 2021
    AND vendas.mes BETWEEN 6 AND 11
    AND vendas.dia_mes BETWEEN 7 AND 27
    GROUP BY GROUPING SETS(vendas.dia_semana, vendas.concelho);

/*2)...num dado distrito(i.e. "Lisboa"), por concelho, categoria, dia da semana e no total*/

SELECT vendas.concelho,vendas.cat, vendas.dia_semana, SUM(vendas.unidades) as total
    FROM vendas
    WHERE vendas.distrito = 'Lisboa'
    GROUP BY ROLLUP(vendas.concelho,vendas.cat,vendas.dia_semana);