
SELECT P.nome, P.cpf
FROM tb_pessoa P
WHERE DEREF(P.endereco).rua = 'Av dos Bobos';

