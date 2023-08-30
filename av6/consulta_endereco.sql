-- CONSULTA VISITANTE QUE MORA NA RUA 'Av dos Bobos'

SELECT
    V.cpf,
    V.nome,
    DEREF(V.endereco).cep AS cep,
    V.numero, DEREF(V.endereco).rua AS rua,
    DEREF(V.endereco).cidade AS cidade,
    DEREF(V.endereco).estado AS estado,
    DEREF(V.endereco).pais AS pais,
    V.comp AS complemento
FROM tb_visitante V
WHERE DEREF(V.endereco).rua = 'Av dos Bobos';
/
