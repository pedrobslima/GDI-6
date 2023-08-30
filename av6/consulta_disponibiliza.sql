--	CONSULTA EQUIPAMENTOS QUE ESTÃO DISPONIVEIS NO PALCO 'X'

SELECT
    D.palco.numero AS "PALCO",
    DEREF(D.equipamento.nome).nome AS "EQUIPAMENTO"
FROM
    tb_disponibiliza D
WHERE
    D.palco.numero = 2;