--	CONSULTA OS SHOWS QUE SE INICIAM ANTES DAS 17:00h

SELECT
    A.nome AS "ATRACAO",
    TO_CHAR(C.data_hora_inicio, 'DD/MM/YYYY') AS "DATA",
    TO_CHAR(C.data_hora_inicio, 'HH24:MI') AS "INICIO",
    TO_CHAR(C.data_hora_termino, 'HH24:MI') AS "TERMINO"
FROM
    tb_atracao A,
    TABLE(CAST(A.cronograma AS tp_nt_cronograma)) C
WHERE
    TO_CHAR(C.data_hora_inicio, 'HH24:MI') <= '17:00';