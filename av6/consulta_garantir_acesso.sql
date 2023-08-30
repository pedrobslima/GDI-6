--	CONSULTA DOS SHOWS QUE 'FELIPE' FREQUENTOU

SELECT
    G.show.atracao.nome AS "SHOW",
    G.ingresso.id_comprad.nome AS visitante
FROM
    tb_garantir_acesso G
WHERE
    G.ingresso.id_comprad.nome = 'Felipe';
