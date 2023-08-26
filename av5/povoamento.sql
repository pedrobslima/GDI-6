-------------------------- TABELA ENDERECO --------------------------
INSERT INTO tb_endereco VALUES (tp_endereco('67130090', 'Av dos Bobos', 'Recife', 'Brasil', 'Pernambuco'));
INSERT INTO tb_endereco VALUES (tp_endereco('52130092', 'Av dos Loucos', 'Fortaleza', 'Brasil', 'Ceará'));
INSERT INTO tb_endereco VALUES (tp_endereco('41330089', 'Rua Pontar', 'Manaus', 'Brasil', 'Amazonas'));
INSERT INTO tb_endereco VALUES (tp_endereco('52130090', 'Av. dos Bobos', 'Fortaleza', 'Brasil', 'Ceara'));
INSERT INTO tb_endereco VALUES (tp_endereco('80050010', 'Rua das Flores', 'Curitiba', 'Brasil', 'Paraná'));
INSERT INTO tb_endereco VALUES (tp_endereco('30310080', 'Av da Liberdade', 'São Paulo', 'Brasil', 'São Paulo'));
INSERT INTO tb_endereco VALUES (tp_endereco('60115100', 'Rua das Palmeiras', 'Rio de Janeiro', 'Brasil', 'Rio de Janeiro'));
INSERT INTO tb_endereco VALUES (tp_endereco('52015150', 'La Paz', 'Recife', 'Brasil', 'Pernambuco'));
INSERT INTO tb_endereco VALUES (tp_endereco('70040900', 'Rua dos Sonhos', 'Porto Alegre', 'Brasil', 'Rio Grande do Sul'));
INSERT INTO tb_endereco VALUES (tp_endereco('40270100', 'Av das Estrelas', 'Salvador', 'Brasil', 'Bahia'));
INSERT INTO tb_endereco VALUES (tp_endereco('58025900', 'Rua das Ondas', 'João Pessoa', 'Brasil', 'Paraíba'));
INSERT INTO tb_endereco VALUES (tp_endereco('50670300', 'Av do Sol', 'Recife', 'Brasil', 'Pernambuco'));
INSERT INTO tb_endereco VALUES (tp_endereco('30130020', 'Rua da Alegria', 'Belo Horizonte', 'Brasil', 'Minas Gerais'));
INSERT INTO tb_endereco VALUES (tp_endereco('40410060', 'Av das Flores', 'Salvador', 'Brasil', 'Bahia'));
INSERT INTO tb_endereco VALUES (tp_endereco('13222747', 'Rua do Peixe Manssinho', 'Recife', 'Brasil', 'Pernambuco'));
INSERT INTO tb_endereco VALUES (tp_endereco('3346649', 'Av dos Bobos', 'Recife', 'Brasil', 'Pernambuco'));
INSERT INTO tb_endereco VALUES (tp_endereco('64479747', 'Rua do Peixe Bravo', 'Recife', 'Brasil', 'Pernambuco'));
INSERT INTO tb_endereco VALUES (tp_endereco('79542768', 'Av Cachorro Feio', 'Sergipe', 'Brasil', 'Maranhão'));

-------------------------- TABELA VISITANTES --------------------------

INSERT INTO tb_visitante VALUES (tp_visitante('12345678910', 'Fulano', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '67130090'), '50a', 'casa', varray_telefone('4002-8922')));
INSERT INTO tb_visitante VALUES (tp_visitante('86468464866', 'Carlos', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130090'), '20', '101', varray_telefone('3378-2425')));
INSERT INTO tb_visitante VALUES (tp_visitante('33747344646', 'Andre', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130092'), '157', 'casa', varray_telefone('2245-5454', '2143-6767')));
INSERT INTO tb_visitante VALUES (tp_visitante('44442424422', 'Felipe', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '41330089'), '38', 'casa', varray_telefone('9989-4844')));
INSERT INTO tb_visitante VALUES (tp_visitante('999999999', 'Claudio', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130090'),'300','202',varray_telefone('83985478965', '83977489654', '83966534789')));

-------------------------- TABELAS DE FUNCIONARIOS --------------------------
INSERT INTO tb_vendedor VALUES (tp_vendedor('89954646461', 'Cleber', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '3346649'), '45', 'casa', varray_telefone('3152-8989', '4853-1461', '1121-3223'), 'INTEGRAL', 2400));
INSERT INTO tb_vendedor VALUES (tp_vendedor('13469737675', 'Mauricio', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '3346649'), '23', 'cond', varray_telefone('6447-9747'), 'INTEGRAL', 2400));
INSERT INTO tb_vendedor VALUES (tp_vendedor('90970242427', 'Clarisse', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '13222747'), '157', 'casa', varray_telefone('6447-9747'), 'NOITE', 1600));

INSERT INTO tb_manutencao VALUES (tp_manutencao('78258946626', 'Pamela', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '50670300'), '47', '405', varray_telefone('3152-8989', '4853-1461', '1121-3223'), 'INTEGRAL', 2400));
INSERT INTO tb_manutencao VALUES (tp_manutencao('58963284152', 'Brita', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '70040900'), '48', 'casa', varray_telefone('3303-0560'), 'INTEGRAL', 2400));
INSERT INTO tb_manutencao VALUES (tp_manutencao('69825317854', 'Geolio', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '80050010'), '98', 'casa', varray_telefone('6987-3244'), 'NOITE', 2400));

INSERT INTO tb_tecnico VALUES (tp_tecnico('99796767331', 'Marceline', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '50670300'), '10', 'casa', varray_telefone('4646-9199'), 'INTEGRAL', 2800));
INSERT INTO tb_tecnico VALUES (tp_tecnico('78258046626', 'Pedro', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '79542768'), '335', 'casa', varray_telefone('3303-0558'), 'NOITE', 2300));
INSERT INTO tb_tecnico VALUES (tp_tecnico('44455979799', 'Netero', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130090'), '77', 'casa', varray_telefone('1134-3646', '7000-7000'),  'DIA', 2100));
INSERT INTO tb_tecnico VALUES (tp_tecnico('32334242444', 'Vilma', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '40270100'), '32', 'casa', varray_telefone('8797-2777'), 'DIA', 2100));

-------------------------- INGRESSOS E MANHÃ-PRECO  --------------------------

INSERT INTO tb_dia_preco VALUES (tp_dia_preco(SYSDATE, 100));
INSERT INTO tb_dia_preco VALUES (tp_dia_preco(SYSDATE + 1, 150));
INSERT INTO tb_dia_preco VALUES (tp_dia_preco(SYSDATE + 2, 80));
INSERT INTO tb_dia_preco VALUES (tp_dia_preco(SYSDATE + 3, 120));
INSERT INTO tb_dia_preco VALUES (tp_dia_preco(SYSDATE + 4, 90));


INSERT INTO tb_ingresso (id_comprad, num_ingresso, dia_evento) VALUES
    (tp_visitante('12345678910', 'Fulano', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '67130090'), '50a', 'casa', varray_telefone('4002-8922')),
    7946,
    (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 0)));

INSERT INTO tb_ingresso (id_comprad, num_ingresso, dia_evento) VALUES
    (tp_visitante('33747344646', 'Andre', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130092'), '157', 'casa', varray_telefone('2245-5454', '2143-6767')),
    5752,
    (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 1)));

INSERT INTO tb_ingresso (id_comprad, num_ingresso, dia_evento) VALUES
    (tp_visitante('86468464866', 'Carlos', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130090'), '20', '101', varray_telefone('3378-2425')),
    8727,
    (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 2)));

INSERT INTO tb_ingresso (id_comprad, num_ingresso, dia_evento) VALUES
    (tp_visitante('44442424422', 'Felipe', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '41330089'), '38', 'casa', varray_telefone('9989-4844')),
    9757,
    (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 1)));

-- POVOANDO NOME_PRECO
INSERT INTO tb_nome_preco VALUES (tp_nome_preco('guitarra aceim preta', 500));
INSERT INTO tb_nome_preco VALUES (tp_nome_preco('bateria yamaha', 2000));
INSERT INTO tb_nome_preco VALUES (tp_nome_preco('baixo weiser', 400));
INSERT INTO tb_nome_preco VALUES (tp_nome_preco('amplificador yamaha', 300));
INSERT INTO tb_nome_preco VALUES (tp_nome_preco('guitarra jonson', 580));
INSERT INTO tb_nome_preco VALUES (tp_nome_preco('refletor móvel', 890));
INSERT INTO tb_nome_preco VALUES (tp_nome_preco('microfone sem fio', 30));
INSERT INTO tb_nome_preco VALUES (tp_nome_preco('liberador de fumaça grande', 75));
INSERT INTO tb_nome_preco VALUES (tp_nome_preco('teclado shueizer', 890));

-- POVOANDO EQUIPAMENTOS
INSERT INTO tb_equipamento  VALUES (tp_equipamento('3535', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'guitarra aceim preta'), 'instrumento'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('741644', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'bateria yamaha'), 'instrumento'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('3433', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'baixo weiser'), 'instrumento'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('9352522', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'amplificador yamaha'), 'eletronico'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('8886444', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'liberador de fumaça grande'), 'eletronico'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('4434', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'guitarra jonson'), 'instrumento'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('3252555', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'refletor móvel'), 'eletronico'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('6466444', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'liberador de fumaça grande'), 'eletronico'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('7332544', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'amplificador yamaha'), 'eletronico'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('5432543', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'microfone sem fio'), 'eletronico'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('4353454', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'microfone sem fio'), 'eletronico'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('4958234', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'microfone sem fio'), 'eletronico'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('1231225', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'microfone sem fio'), 'eletronico'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('1234444', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'liberador de fumaça grande'), 'eletronico'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('5335353', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'teclado shueizer'), 'instrumento'));
INSERT INTO tb_equipamento  VALUES (tp_equipamento('7000522', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'amplificador yamaha'), 'eletronico'));

-- POVOANDO PALCOS

INSERT INTO tb_palco VALUES (tp_palco(1, '1000'));
INSERT INTO tb_palco VALUES (tp_palco(2, '2000'));
INSERT INTO tb_palco VALUES (tp_palco(3, '1300'));
INSERT INTO tb_palco VALUES (tp_palco(4, '400'));

-- DISPONIBILIZA

INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(1, '1000'), tp_equipamento('3535', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'guitarra aceim preta'), 'instrumento')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(2, '2000'), tp_equipamento('741644', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'bateria yamaha'), 'instrumento')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(3, '1300'), tp_equipamento('3433', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'baixo weiser'), 'instrumento')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(4, '400'), tp_equipamento('9352522', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'amplificador yamaha'), 'eletronico')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(1, '1000'), tp_equipamento('8886444', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'liberador de fumaça grande'), 'eletronico')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(2, '2000'), tp_equipamento('4434', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'guitarra jonson'), 'instrumento')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(3, '1300'), tp_equipamento('3252555', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'refletor móvel'), 'eletronico')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(4, '400'), tp_equipamento('6466444', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'liberador de fumaça grande'), 'eletronico')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(1, '1000'), tp_equipamento('7332544', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'amplificador yamaha'), 'eletronico')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(2, '2000'), tp_equipamento('5432543', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'microfone sem fio'), 'eletronico')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(3, '1300'), tp_equipamento('4353454', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'microfone sem fio'), 'eletronico')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(4, '400'), tp_equipamento('4958234', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'microfone sem fio'), 'eletronico')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(1, '1000'), tp_equipamento('1231225', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'microfone sem fio'), 'eletronico')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(1, '1000'), tp_equipamento('1234444', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'liberador de fumaça grande'), 'eletronico')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(1, '1000'), tp_equipamento('5335353', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'teclado shueizer'), 'instrumento')));
INSERT INTO tb_disponibiliza VALUES (tp_disponibiliza(tp_palco(1, '1000'), tp_equipamento('7000522', (SELECT REF(Eq) FROM tb_nome_preco Eq WHERE Eq.nome = 'amplificador yamaha'), 'eletronico')));

-- ATRACAO

INSERT INTO tb_atracao VALUES(
    tp_atracao(
        'Megadeth',
        20000,
        varray_contatos(
            '(+12)39867398',
            'megadeth@gmail.com'
        ),
        tp_nt_cronograma(
            tp_cronograma(
                TO_DATE('2023-07-20 18:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-20 20:00', 'YYYY-MM-DD HH24:MI')
                ),
            tp_cronograma(
                TO_DATE('2023-07-21 18:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-21 20:00', 'YYYY-MM-DD HH24:MI')
                ),
            tp_cronograma(
                TO_DATE('2023-07-21 21:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-21 22:00', 'YYYY-MM-DD HH24:MI')
                )
        ),
        NULL
)
);  

INSERT INTO tb_atracao VALUES(
    tp_atracao(
        'King Crimson',
        10000,
        varray_contatos(
            '(+12)23908574',
            '(+13)92478579',
            'kingcrimson@gmail.com'
        ),
        tp_nt_cronograma(
            tp_cronograma(
                TO_DATE('2023-07-22 18:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-22 20:00', 'YYYY-MM-DD HH24:MI')
                ),
            tp_cronograma(
                TO_DATE('2023-07-19 18:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-19 20:00', 'YYYY-MM-DD HH24:MI')
                ),
            tp_cronograma(
                TO_DATE('2023-07-19 21:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-19 22:00', 'YYYY-MM-DD HH24:MI')
                )
        ),
        NULL
)
);

INSERT INTO tb_atracao VALUES(
    tp_atracao(
        'Daisuke Ishiwatari',
        1000,
        varray_contatos(
            '(+89)60908574',
            'daisuke@arcsys.com'
        ),
        NULL,
        NULL
)
);

INSERT INTO tb_atracao VALUES(
    tp_atracao(
        'NAOKI',
        5000,
        varray_contatos(
            'naoki@arcsys.com'
        ),
        tp_nt_cronograma(
            tp_cronograma(
                TO_DATE('2023-07-20 16:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-20 17:00', 'YYYY-MM-DD HH24:MI')
                ),
            tp_cronograma(
                TO_DATE('2023-07-19 16:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-19 17:00', 'YYYY-MM-DD HH24:MI')
                ),
            tp_cronograma(
                TO_DATE('2023-07-19 22:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-19 23:00', 'YYYY-MM-DD HH24:MI')
                )
        ),
        (SELECT REF(A) FROM tb_atracao A WHERE A.nome = 'Daisuke Ishiwatari')
)
); 

-- SHOWS
INSERT INTO tb_show VALUES (
    tp_atracao('Megadeth',20000,
        varray_contatos('(+12)39867398', 'megadeth@gmail.com'),
        tp_nt_cronograma(
            tp_cronograma(TO_DATE('2023-07-20 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-20 20:00', 'YYYY-MM-DD HH24:MI')),
            tp_cronograma(TO_DATE('2023-07-21 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-21 20:00', 'YYYY-MM-DD HH24:MI')),
            tp_cronograma(TO_DATE('2023-07-21 21:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-21 22:00', 'YYYY-MM-DD HH24:MI'))),
        NULL), 
    tp_palco(1, '1000'), '2023-07-22 15:00-17:00',
    (SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = '99796767331')    
);

INSERT INTO tb_show VALUES (
    tp_atracao(
        'King Crimson',10000,
        varray_contatos('(+12)23908574','(+13)92478579','kingcrimson@gmail.com'),
        tp_nt_cronograma(
            tp_cronograma(TO_DATE('2023-07-22 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-22 20:00', 'YYYY-MM-DD HH24:MI')),
            tp_cronograma(TO_DATE('2023-07-19 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-19 20:00', 'YYYY-MM-DD HH24:MI')),
            tp_cronograma(TO_DATE('2023-07-19 21:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-19 22:00', 'YYYY-MM-DD HH24:MI'))),
        NULL),
    tp_palco(3, '1300'), '2023-07-22 15:00-17:00', 
    (SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = '32334242444')
);

INSERT INTO tb_show VALUES (
    tp_atracao(
        'NAOKI',5000,
        varray_contatos('naoki@arcsys.com'),
        tp_nt_cronograma(
            tp_cronograma(TO_DATE('2023-07-20 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-20 17:00', 'YYYY-MM-DD HH24:MI')),
            tp_cronograma(TO_DATE('2023-07-19 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-19 17:00', 'YYYY-MM-DD HH24:MI')),
            tp_cronograma(TO_DATE('2023-07-19 22:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-19 23:00', 'YYYY-MM-DD HH24:MI'))),
        (SELECT REF(A) FROM tb_atracao A WHERE A.nome = 'Daisuke Ishiwatari')),
    tp_palco(2, '2000'), '2023-07-22 15:00-17:00',
    (SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = '23456780000')
);

-- COMPRAS
INSERT INTO tb_compra VALUES (
    tp_ingresso(
        tp_visitante('33747344646', 'Andre', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130092'), '157', 'casa', varray_telefone('2245-5454', '2143-6767')),
        5752,
        (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 1))),
    (SELECT REF(V) FROM tb_vendedor V WHERE V.cpf = '90970242427')
);

INSERT INTO tb_compra VALUES(
    tp_ingresso(
        tp_visitante('12345678910', 'Fulano', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '67130090'), '50a', 'casa', varray_telefone('4002-8922')),
        7946,
        (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 0))),
    (SELECT REF(V) FROM tb_vendedor V WHERE V.cpf = '13469737675')
);

INSERT INTO tb_compra VALUES(
    tp_ingresso(
        tp_visitante('86468464866', 'Carlos', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130090'), '20', '101', varray_telefone('3378-2425')),
        8727,
        (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 2))),
    (SELECT REF(V) FROM tb_vendedor V WHERE V.cpf = '90970242427')
);

INSERT INTO tb_compra VALUES(
    tp_ingresso(
        tp_visitante('44442424422', 'Felipe', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '41330089'), '38', 'casa', varray_telefone('9989-4844')),
        9757,
        (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 1))),
    (SELECT REF(V) FROM tb_vendedor V WHERE V.cpf = '89954646461')
);

-- GARANTIR ACESSO

INSERT INTO tb_garantir_acesso VALUES(
    tp_show(
        tp_atracao('Megadeth',20000,
            varray_contatos('(+12)39867398', 'megadeth@gmail.com'),
            tp_nt_cronograma(
                tp_cronograma(TO_DATE('2023-07-20 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-20 20:00', 'YYYY-MM-DD HH24:MI')),
                tp_cronograma(TO_DATE('2023-07-21 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-21 20:00', 'YYYY-MM-DD HH24:MI')),
                tp_cronograma(TO_DATE('2023-07-21 21:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-21 22:00', 'YYYY-MM-DD HH24:MI'))),
            NULL), 
        tp_palco(1, '1000'), '2023-07-22 15:00-17:00',
        (SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = '99796767331')),
    tp_ingresso(
        tp_visitante('33747344646', 'Andre', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130092'), '157', 'casa', varray_telefone('2245-5454', '2143-6767')),
        5752,
        (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 1)))
);

INSERT INTO tb_garantir_acesso VALUES(
    tp_show(
        tp_atracao(
            'King Crimson',10000,
            varray_contatos('(+12)23908574','(+13)92478579','kingcrimson@gmail.com'),
            tp_nt_cronograma(
                tp_cronograma(TO_DATE('2023-07-22 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-22 20:00', 'YYYY-MM-DD HH24:MI')),
                tp_cronograma(TO_DATE('2023-07-19 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-19 20:00', 'YYYY-MM-DD HH24:MI')),
                tp_cronograma(TO_DATE('2023-07-19 21:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-19 22:00', 'YYYY-MM-DD HH24:MI'))),
            NULL),
        tp_palco(3, '1300'), '2023-07-22 15:00-17:00', 
        (SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = '32334242444')),
    tp_ingresso(
        tp_visitante('12345678910', 'Fulano', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '67130090'), '50a', 'casa', varray_telefone('4002-8922')),
        7946,
        (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 0)))
);

INSERT INTO tb_garantir_acesso VALUES(
    tp_show(
        tp_atracao(
            'NAOKI',5000,
            varray_contatos('naoki@arcsys.com'),
            tp_nt_cronograma(
                tp_cronograma(TO_DATE('2023-07-20 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-20 17:00', 'YYYY-MM-DD HH24:MI')),
                tp_cronograma(TO_DATE('2023-07-19 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-19 17:00', 'YYYY-MM-DD HH24:MI')),
                tp_cronograma(TO_DATE('2023-07-19 22:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-19 23:00', 'YYYY-MM-DD HH24:MI'))),
            (SELECT REF(A) FROM tb_atracao A WHERE A.nome = 'Daisuke Ishiwatari')),
        tp_palco(2, '2000'), '2023-07-22 15:00-17:00',
        (SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = '23456780000')
    ),
    tp_ingresso(
        tp_visitante('86468464866', 'Carlos', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130090'), '20', '101', varray_telefone('3378-2425')),
        8727,
        (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 2)))
);

INSERT INTO tb_garantir_acesso VALUES(
    tp_show(
        tp_atracao('Megadeth',20000,
            varray_contatos('(+12)39867398', 'megadeth@gmail.com'),
            tp_nt_cronograma(
                tp_cronograma(TO_DATE('2023-07-20 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-20 20:00', 'YYYY-MM-DD HH24:MI')),
                tp_cronograma(TO_DATE('2023-07-21 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-21 20:00', 'YYYY-MM-DD HH24:MI')),
                tp_cronograma(TO_DATE('2023-07-21 21:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-07-21 22:00', 'YYYY-MM-DD HH24:MI'))),
            NULL), 
        tp_palco(1, '1000'), '2023-07-22 15:00-17:00',
        (SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = '99796767331')),
    tp_ingresso(
        tp_visitante('44442424422', 'Felipe', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '41330089'), '38', 'casa', varray_telefone('9989-4844')),
        9757,
        (SELECT REF(DP) FROM tb_dia_preco DP WHERE TRUNC(DP.dia_evento) = TRUNC(SYSDATE + 1)))
);