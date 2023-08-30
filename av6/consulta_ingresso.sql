-- MAP MEMBER FUNCTION venda_total:

SELECT DP.dia_evento, DP.venda_total() AS total_de_vendas FROM tb_dia_preco DP



-- VISITANTE COM INGRESSOS PARA O DIA 31/08/2023
SELECT v.nome
FROM tb_ingresso i
JOIN tb_dia_preco d ON DEREF(i.dia_evento) = REF(d)
JOIN tb_visitante v ON DEREF(i.id_comprad) = REF(v)
WHERE d.dia_evento = DATE '2023-08-31'