-------------------------- TABELA ENDERECO --------------------------
INSERT INTO tb_endereco VALUES (tp_endereco('52130090', 'Av dos Bobos', 'Fortaleza', 'Brasil', 'Ceará'));
INSERT INTO tb_endereco VALUES (tp_endereco('52130092', 'Av dos Loucos', 'Fortaleza', 'Brasil', 'Ceará'));
INSERT INTO tb_endereco VALUES (tp_endereco('41330089', 'Rua Pontar', 'Manaus', 'Brasil', 'Amazonas'));

-------------------------- TABELA VISITANTES --------------------------
INSERT INTO tb_visitante VALUES (tp_visitante('70545678777', 'Valter', tp_telefone('4664-7588'), tp_endereco('55443-584', 'Sao Marcos', 'Recife', 'Brasil', 'Pernambuco', '20', 'casa')));
INSERT INTO tb_visitante VALUES (tp_visitante('23456744899', 'Caetano', tp_telefone('1247-8697', '7789-7852', '4456-8879'), tp_endereco('48792-470', 'Rua 2', 'Salvador', 'Brasil', 'Bahia', '26', 'cond')));
INSERT INTO tb_visitante VALUES (tp_visitante('45912764897', 'Priscila', tp_telefone('4002-8922', '5778-5859'), tp_endereco('32897-457', 'Santo Silvio', 'São Paulo', 'Brasil', 'São Paulo', '113', 'apto')));
INSERT INTO tb_visitante VALUES (tp_visitante('75912764890', 'Valdivia', tp_telefone('7852-8146', '3334-5557'), tp_endereco('57577-834', 'Rua verde', 'Carpina', 'Brasil', 'Pernambuco', '45', 'casa')));
INSERT INTO tb_visitante VALUES (tp_visitante('45912764897', 'Angenor', tp_telefone('1414-3222', '2112-3343'), tp_endereco('34252-353', 'Av Vermelha', 'Camaragibe', 'Brasil', 'Pernambuco', '78', 'casa')));
INSERT INTO tb_visitante VALUES (tp_visitante('52435665892', 'Pariston', tp_telefone('3779-7411'), tp_endereco('11232-221', 'Rua pinheiro', 'Abreu e Lima', 'Brasil', 'Pernambuco', '87', 'casa')));
INSERT INTO tb_visitante VALUES (tp_visitante('89666469555', 'Micon', tp_telefone('2106-8482', '1123-7989', '4564-4899'), tp_endereco('80080-321', 'Av Jackson', 'Salvador', 'Brasil', 'Bahia', '113', 'casa')));
INSERT INTO tb_visitante VALUES (tp_visitante('12345678910', 'Fulano', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130090'), '50a', 'casa', varray_telefone('4002-8922')));
INSERT INTO tb_visitante VALUES (tp_visitante('86468464866', 'Carlos', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130090'), '20', '101', varray_telefone('3378-2425')));
INSERT INTO tb_visitante VALUES (tp_visitante('33747344646', 'Andre', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130092'), '157', 'casa', varray_telefone('2245-5454', '2143-6767')));
INSERT INTO tb_visitante VALUES (tp_visitante('44442424422', 'Felipe', (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '41330089'), '38', 'casa', varray_telefone('9989-4844')));

-------------------------- TABELAS DE FUNCIONARIOS --------------------------
DROP TABLE tabela_tecnicos;
CREATE TABLE tabela_vendedores (funcionario tp_vendedor);
INSERT INTO tabela_vendedores (funcionario) VALUES (tp_vendedor('89954646461', 'Cleber', tp_telefone('3152-8989', '4853-1461', '1121-3223'), tp_endereco('99161-141', 'Av Diferente', 'Afogados', 'Brasil', 'Pernambuco', '45', 'casa'), 'INT', 2400));
INSERT INTO tabela_vendedores (funcionario) VALUES (tp_vendedor('13469737675', 'Mauricio', tp_telefone('6479-4747'), tp_endereco('14141-242', 'Rua Lenta', 'Jordão', 'Brasil', 'Mato Grosso', '23', 'cond'), 'INT', 2400));
INSERT INTO tabela_vendedores (funcionario) VALUES (tp_vendedor('90970242427', 'Clarisse', tp_telefone('1133-6677', '8811-2233'), tp_endereco('13222-747', 'Rua Rapida', 'Coqueiral', 'Brasil', 'Pernambuco', '157', 'casa'), 'NOI', 1600));

DROP TABLE tabela_tecnicos;
CREATE TABLE tabela_manutencao (funcionario tp_manutencao);
INSERT INTO tabela_manutencao (funcionario) VALUES (tp_manutencao('44455979799', 'Netero', tp_telefone('1134-3646', '7000-7000'), tp_endereco('78778-889', 'Rua de Pedra', 'Camaragibe', 'Brasil', 'Pernambuco', '77', 'casa'), 'DIA', 2100));
INSERT INTO tabela_manutencao (funcionario) VALUES (tp_manutencao('32334242444', 'Vilma', tp_telefone( '8797-2777'), tp_endereco('98988-214', 'Av Vasco', 'Candeias', 'Brasil', 'Pernambuco', '32', 'casa'), 'DIA', 2100));
INSERT INTO tabela_manutencao (funcionario) VALUES (tp_manutencao('99796767331', 'Marceline', tp_telefone('4646-9199'), tp_endereco('89756-534', 'Rua Peixe Brabo', 'Abreu e Lima', 'Brasil', 'Pernambuco', '10', 'casa'), 'INT', 2800));
INSERT INTO tabela_manutencao (funcionario) VALUES (tp_manutencao('78258946626', 'Pamela', tp_telefone('3303-0558'), tp_endereco('79542-768', 'Av Cachorro Feio', 'Sergipe', 'Brasil', 'Maranhão', '335', 'casa'), 'NOI', 2300));

DROP TABLE tabela_tecnicos;
CREATE TABLE tabela_tecnicos   (funcionario tp_tecnico);
INSERT INTO tabela_tecnicos (funcionario) VALUES (tp_tecnico('23456780000', 'Gabriel', tp_telefone('1905-1414'), tp_endereco('49749-764', 'Rua do Potinho', 'Jordão Baixo', 'Brasil', 'Pernambuco', '55', 'casa'), 'DIA', 2900));
INSERT INTO tabela_tecnicos (funcionario) VALUES (tp_tecnico('88075975357', 'Solange', tp_telefone('4766-7647'), tp_endereco('76347-676', 'Av do Caldinho', 'São Lorenço', 'Brasil', 'Pernambuco', '77', 'casa'), 'DIA', 2900));
INSERT INTO tabela_tecnicos (funcionario) VALUES (tp_tecnico('28549655454', 'Paula', tp_telefone('3731-6577', '5731-7174'), tp_endereco('11221-343', 'Rua Asfaltada', 'Abreu e Lima', 'Brasil', 'Pernambuco', '88', 'casa'), 'INT', 3500));
INSERT INTO tabela_tecnicos (funcionario) VALUES (tp_tecnico('63556585358', 'Rafaela', tp_telefone('8680-6146'), tp_endereco('43773-747', 'Av Peixe Mansinho', 'Casa Caiada', 'Brasil', 'Pernambuco', '99', 'casa'), 'NOI', 3100));

