-- CONSULTA AS VENDAS DO FUNCIONARIO DE CPF 'X'. ~~VENDEDORES: [89954646461, 13469737675, 90970242427]

SELECT
    DEREF(C.vendedor).nome AS vendedor,
    C.ingresso.id_comprad.nome AS comprador,
    DEREF(C.ingresso.dia_evento).preco AS preco,
    DEREF(C.ingresso.dia_evento).dia_evento AS "DIA EVENTO"
FROM
    tb_compra C
WHERE
    DEREF(C.vendedor).cpf = '90970242427';