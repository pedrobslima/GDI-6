DROP TABLE tabela_pessoas;
CREATE TABLE tabela_pessoas (pessoa tp_pessoa);

INSERT INTO tabela_pessoas (pessoa) VALUES (
    tp_pessoa(
        '70545678777', 
        'Erbert', 
        tp_telefone('4664-7588'), 
        tp_endereco('51445-230', 'Sao Xavier', 'Recife', 'Brasil', 'Pernambuco', '20', 'casa')
    )
);

INSERT INTO tabela_pessoas (pessoa) VALUES (
    tp_pessoa(
        '23456744899', 
        'Caetano', 
        tp_telefone('1247-8697', '7789-7852', '4456-8879'),
        tp_endereco('48792-470', 'Rua 2', 'Salvador', 'Brasil', 'Bahia', '26', 'cond')
    )
);

INSERT INTO tabela_pessoas (pessoa) VALUES (
    tp_pessoa(
        '45912764897', 
        'Priscila', 
        tp_telefone('4002-8922', '5778-5859'), 
        tp_endereco('32897-457', 'Santo Silvio', 'São Paulo', 'Brasil', 'São Paulo', '113', 'apto')
    )
);

SELECT p.pessoa.cpf, p.pessoa.nome, p.pessoa.endereco.exibir_detalhes(), p.pessoa.get_telefones() FROM tabela_pessoas p;