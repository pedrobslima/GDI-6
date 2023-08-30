-- MAP MEMBER FUNCTION venda_total:

SELECT DP.dia_evento, DP.venda_total() AS total_de_vendas FROM tb_dia_preco DP



-- CONSULTA OS VISITANTES COM INGRESSOS PARA O DIA ATUAL E O SEGUINTE
SELECT
    I.id_comprad.cpf AS cpf,
    I.id_comprad.nome AS nome,
    DEREF(dia_evento).dia_evento AS "DIA EVENTO"
FROM
    tb_ingresso I
WHERE
    TRUNC(DEREF(I.dia_evento).dia_evento)
IN
    (TRUNC(SYSDATE + 0), TRUNC(SYSDATE + 1))
ORDER BY
    "DIA EVENTO";
