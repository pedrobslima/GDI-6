
-------------------------- TABELA VISITANTES --------------------------
DROP TABLE tabela_visitantes;
CREATE TABLE tabela_visitantes (visitante tp_visitante);

INSERT INTO tabela_visitantes (visitante) VALUES (
    tp_visitante(
        '70545678777', 
        'Valter', 
        tp_telefone('4664-7588'), 
        tp_endereco('55443-584', 'Sao Marcos', 'Recife', 'Brasil', 'Pernambuco', '20', 'casa')
    )
);

INSERT INTO tabela_visitantes (visitante) VALUES (
    tp_visitante(
        '23456744899', 
        'Caetano', 
        tp_telefone('1247-8697', '7789-7852', '4456-8879'),
        tp_endereco('48792-470', 'Rua 2', 'Salvador', 'Brasil', 'Bahia', '26', 'cond')
    )
);

INSERT INTO tabela_visitantes (visitante) VALUES (
    tp_visitante(
        '45912764897', 
        'Priscila', 
        tp_telefone('4002-8922', '5778-5859'), 
        tp_endereco('32897-457', 'Santo Silvio', 'São Paulo', 'Brasil', 'São Paulo', '113', 'apto')
    )
);

SELECT v.visitante.cpf AS CPF, v.visitante.nome AS NOME, v.visitante.endereco.cep AS CEP, v.visitante.endereco.exibir_detalhes() AS ENDERECO, v.visitante.get_telefones() AS TELEFONES FROM tabela_visitantes v;