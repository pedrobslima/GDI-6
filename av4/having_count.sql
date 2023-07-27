SELECT F.turno, COUNT(F.id_func)
FROM Funcionario F 
LEFT OUTER JOIN Compra C ON F.id_func = C.vendedor
LEFT OUTER JOIN Ingresso I ON C.num_ingresso = I.num_ingresso AND F.id_func = I.id_comprad
GROUP BY F.turno
HAVING COUNT(F.id_func) > 4;