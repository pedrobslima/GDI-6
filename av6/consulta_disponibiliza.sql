--	CONSULTA EQUIPAMENTOS, COM NOME E PRECO, QUE ESTÃO DISPONIVEIS NO PALCO 'X'

SELECT
    D.palco.numero AS "PALCO",
    DEREF(D.equipamento.nome).nome AS "EQUIPAMENTO",
    P.preco
FROM
    tb_disponibiliza D,
    tb_nome_preco P
WHERE
    D.palco.numero = 2
    AND
    DEREF(D.equipamento.nome).nome = P.nome;