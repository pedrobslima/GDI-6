-------------------------- TABELA ENDERECO --------------------------
INSERT INTO tb_endereco VALUES (tp_endereco('67130090', 'Av dos Bobos', 'Recife', 'Brasil', 'Pernambuco'));
INSERT INTO tb_endereco VALUES (tp_endereco('52130092', 'Av dos Loucos', 'Fortaleza', 'Brasil', 'Ceará'));
INSERT INTO tb_endereco VALUES (tp_endereco('41330089', 'Rua Pontar', 'Manaus', 'Brasil', 'Amazonas'));

-------------------------- TABELA VISITANTES --------------------------
/*
INSERT INTO tb_visitante VALUES (tp_visitante('70545678777', 'Valter', tp_telefone('4664-7588'), tp_endereco('55443-584', 'Sao Marcos', 'Recife', 'Brasil', 'Pernambuco', '20', 'casa')));
INSERT INTO tb_visitante VALUES (tp_visitante('23456744899', 'Caetano', tp_telefone('1247-8697', '7789-7852', '4456-8879'), tp_endereco('48792-470', 'Rua 2', 'Salvador', 'Brasil', 'Bahia', '26', 'cond')));
INSERT INTO tb_visitante VALUES (tp_visitante('45912764897', 'Priscila', tp_telefone('4002-8922', '5778-5859'), tp_endereco('32897-457', 'Santo Silvio', 'São Paulo', 'Brasil', 'São Paulo', '113', 'apto')));
INSERT INTO tb_visitante VALUES (tp_visitante('75912764890', 'Valdivia', tp_telefone('7852-8146', '3334-5557'), tp_endereco('57577-834', 'Rua verde', 'Carpina', 'Brasil', 'Pernambuco', '45', 'casa')));
INSERT INTO tb_visitante VALUES (tp_visitante('45912764897', 'Angenor', tp_telefone('1414-3222', '2112-3343'), tp_endereco('34252-353', 'Av Vermelha', 'Camaragibe', 'Brasil', 'Pernambuco', '78', 'casa')));
INSERT INTO tb_visitante VALUES (tp_visitante('52435665892', 'Pariston', tp_telefone('3779-7411'), tp_endereco('11232-221', 'Rua pinheiro', 'Abreu e Lima', 'Brasil', 'Pernambuco', '87', 'casa')));
INSERT INTO tb_visitante VALUES (tp_visitante('89666469555', 'Micon', tp_telefone('2106-8482', '1123-7989', '4564-4899'), tp_endereco('80080-321', 'Av Jackson', 'Salvador', 'Brasil', 'Bahia', '113', 'casa')));*/
INSERT INTO tb_visitante VALUES (tp_visitante('12345678910', 'Fulano', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '67130090'), '50a', 'casa', varray_telefone('4002-8922')));
INSERT INTO tb_visitante VALUES (tp_visitante('86468464866', 'Carlos', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130090'), '20', '101', varray_telefone('3378-2425')));
INSERT INTO tb_visitante VALUES (tp_visitante('33747344646', 'Andre', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130092'), '157', 'casa', varray_telefone('2245-5454', '2143-6767')));
INSERT INTO tb_visitante VALUES (tp_visitante('44442424422', 'Felipe', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '41330089'), '38', 'casa', varray_telefone('9989-4844')));

-------------------------- TABELAS DE FUNCIONARIOS --------------------------
CREATE TABLE tabela_vendedores (funcionario tp_vendedor);
INSERT INTO tabela_vendedores (funcionario) VALUES (tp_vendedor('89954646461', 'Cleber', tp_telefone('3152-8989', '4853-1461', '1121-3223'), tp_endereco('99161-141', 'Av Diferente', 'Afogados', 'Brasil', 'Pernambuco', '45', 'casa'), 'INT', 2400));
INSERT INTO tabela_vendedores (funcionario) VALUES (tp_vendedor('13469737675', 'Mauricio', tp_telefone('6479-4747'), tp_endereco('14141-242', 'Rua Lenta', 'Jordão', 'Brasil', 'Mato Grosso', '23', 'cond'), 'INT', 2400));
INSERT INTO tabela_vendedores (funcionario) VALUES (tp_vendedor('90970242427', 'Clarisse', tp_telefone('1133-6677', '8811-2233'), tp_endereco('13222-747', 'Rua Rapida', 'Coqueiral', 'Brasil', 'Pernambuco', '157', 'casa'), 'NOI', 1600));

CREATE TABLE tabela_manutencao (funcionario tp_manutencao);
INSERT INTO tabela_manutencao (funcionario) VALUES (tp_manutencao('44455979799', 'Netero', tp_telefone('1134-3646', '7000-7000'), tp_endereco('78778-889', 'Rua de Pedra', 'Camaragibe', 'Brasil', 'Pernambuco', '77', 'casa'), 'DIA', 2100));
INSERT INTO tabela_manutencao (funcionario) VALUES (tp_manutencao('32334242444', 'Vilma', tp_telefone( '8797-2777'), tp_endereco('98988-214', 'Av Vasco', 'Candeias', 'Brasil', 'Pernambuco', '32', 'casa'), 'DIA', 2100));
INSERT INTO tabela_manutencao (funcionario) VALUES (tp_manutencao('99796767331', 'Marceline', tp_telefone('4646-9199'), tp_endereco('89756-534', 'Rua Peixe Brabo', 'Abreu e Lima', 'Brasil', 'Pernambuco', '10', 'casa'), 'INT', 2800));
INSERT INTO tabela_manutencao (funcionario) VALUES (tp_manutencao('78258946626', 'Pamela', tp_telefone('3303-0558'), tp_endereco('79542-768', 'Av Cachorro Feio', 'Sergipe', 'Brasil', 'Maranhão', '335', 'casa'), 'NOI', 2300));

CREATE TABLE tabela_tecnicos   (funcionario tp_tecnico);
INSERT INTO tabela_tecnicos (funcionario) VALUES (tp_tecnico('23456780000', 'Gabriel', tp_telefone('1905-1414'), tp_endereco('49749-764', 'Rua do Potinho', 'Jordão Baixo', 'Brasil', 'Pernambuco', '55', 'casa'), 'DIA', 2900));
INSERT INTO tabela_tecnicos (funcionario) VALUES (tp_tecnico('88075975357', 'Solange', tp_telefone('4766-7647'), tp_endereco('76347-676', 'Av do Caldinho', 'São Lorenço', 'Brasil', 'Pernambuco', '77', 'casa'), 'DIA', 2900));
INSERT INTO tabela_tecnicos (funcionario) VALUES (tp_tecnico('28549655454', 'Paula', tp_telefone('3731-6577', '5731-7174'), tp_endereco('11221-343', 'Rua Asfaltada', 'Abreu e Lima', 'Brasil', 'Pernambuco', '88', 'casa'), 'INT', 3500));
INSERT INTO tabela_tecnicos (funcionario) VALUES (tp_tecnico('63556585358', 'Rafaela', tp_telefone('8680-6146'), tp_endereco('43773-747', 'Av Peixe Mansinho', 'Casa Caiada', 'Brasil', 'Pernambuco', '99', 'casa'), 'NOI', 3100));

-------------------------- INGRESSOS E DIA-PRECO  --------------------------
CREATE TABLE tb_dia_preco OF tp_dia_preco;
INSERT INTO tb_dia_preco VALUES (tp_dia_preco(SYSDATE, 100.00));
INSERT INTO tb_dia_preco VALUES (tp_dia_preco(SYSDATE + 1, 150.00));
INSERT INTO tb_dia_preco VALUES (tp_dia_preco(SYSDATE + 2, 80.00));
INSERT INTO tb_dia_preco VALUES (tp_dia_preco(SYSDATE + 3, 120.00));
INSERT INTO tb_dia_preco VALUES (tp_dia_preco(SYSDATE + 4, 90.00));



CREATE TABLE tb_ingresso OF tp_ingresso;
DECLARE
    v_id_comprad REF tp_visitante;
    v_dia_preco REF tp_dia_preco;
    v_data DATE;
BEGIN
    v_data := TRUNC(SYSDATE);
    SELECT REF(T) INTO v_dia_preco FROM tb_dia_preco T WHERE TRUNC(T.dia_evento) = v_data;
    SELECT REF(V) INTO v_id_comprad FROM tb_visitante V WHERE V.cpf = '70545678777';
    INSERT INTO tb_ingresso (id_comprad, num_ingresso, dia_evento) VALUES (v_id_comprad, 4964, v_dia_preco);
    
    v_data := TRUNC(SYSDATE + 1);
    SELECT REF(T) INTO v_dia_preco FROM tb_dia_preco T WHERE TRUNC(T.dia_evento) = v_data;
    SELECT REF(V) INTO v_id_comprad FROM tb_visitante V WHERE V.cpf = '23456744899';
    INSERT INTO tb_ingresso (id_comprad, num_ingresso, dia_evento) VALUES (v_id_comprad, 5597, v_dia_preco);
    
    v_data := TRUNC(SYSDATE + 2);
    SELECT REF(T) INTO v_dia_preco FROM tb_dia_preco T WHERE TRUNC(T.dia_evento) = v_data;
    SELECT REF(V) INTO v_id_comprad FROM tb_visitante V WHERE V.cpf = '45912764897';
    INSERT INTO tb_ingresso (id_comprad, num_ingresso, dia_evento) VALUES (v_id_comprad, 3124, v_dia_preco);
    
    v_data := TRUNC(SYSDATE + 3);
    SELECT REF(T) INTO v_dia_preco FROM tb_dia_preco T WHERE TRUNC(T.dia_evento) = v_data;
    SELECT REF(V) INTO v_id_comprad FROM tb_visitante V WHERE V.cpf = '75912764890';
    INSERT INTO tb_ingresso (id_comprad, num_ingresso, dia_evento) VALUES (v_id_comprad, 7558, v_dia_preco);

    v_data := TRUNC(SYSDATE + 2);
    SELECT REF(T) INTO v_dia_preco FROM tb_dia_preco T WHERE TRUNC(T.dia_evento) = v_data;
    SELECT REF(V) INTO v_id_comprad FROM tb_visitante V WHERE V.cpf = '70545678777';
    INSERT INTO tb_ingresso (id_comprad, num_ingresso, dia_evento) VALUES (v_id_comprad, 1604, v_dia_preco);
END;
/
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