-- A consulta a seguir tem como objetivo contar quantos funcionários têm mais de 4 vendas (ou seja, compraram ingressos) por turno.
--  Caso um funcionário tenha mais de uma compra registrada na tabela "Compra" ou mais de um ingresso registrado na tabela "Ingresso", e ambos estão relacionados ao mesmo funcionário através das condições de junção especificadas nos LEFT OUTER JOINs. 
SELECT F.turno, COUNT(F.id_func)
FROM Funcionario F 
LEFT OUTER JOIN Compra C ON F.id_func = C.vendedor -- LEFT OUTER JOIN
LEFT OUTER JOIN Ingresso I ON C.num_ingresso = I.num_ingresso AND F.id_func = I.id_comprad
GROUP BY F.turno
HAVING COUNT(F.id_func) > 4; -- HAVING