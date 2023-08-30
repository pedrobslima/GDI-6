-- CONSULTA TELEFONE DE TODOS FUNCIONARIOS

SELECT nome, cpf, telefone
FROM (
    SELECT nome, cpf, column_value AS telefone
    FROM tb_vendedor
    JOIN TABLE(telefone) ON 1=1

    UNION ALL

    SELECT nome, cpf, column_value AS telefone
    FROM tb_manutencao
    JOIN TABLE(telefone) ON 1=1

    UNION ALL

    SELECT nome, cpf, column_value AS telefone
    FROM tb_tecnico
    JOIN TABLE(telefone) ON 1=1
);
