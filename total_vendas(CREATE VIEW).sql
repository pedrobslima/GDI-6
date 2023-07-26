-- POVOAMENTO
INSERT INTO Endereco(cep, rua, cidade, estado, pais) VALUES ('12345-789', 'Av. Sao Xavier', 'Recife', 'PE', 'Brasil');
INSERT INTO Endereco(cep, rua, cidade, estado, pais) VALUES ('54321-789', 'Av. Santo Antonio', 'Jaboatão', 'PE', 'Brasil');
INSERT INTO Endereco(cep, rua, cidade, estado, pais) VALUES ('12345-987', 'Rua Jose Marcos', 'Tracunhaem', 'PE', 'Brasil');
INSERT INTO Endereco(cep, rua, cidade, estado, pais) VALUES ('12345-000', 'Rua Marcos II', 'São Souza', 'SP', 'Brasil');
INSERT INTO Endereco(cep, rua, cidade, estado, pais) VALUES ('02468-123', 'Av. Palmares', 'Camaragibe', 'PE', 'Brasil');

INSERT INTO Pessoa (cpf, nome, cep, numero, comp) VALUES ('70292933479', 'Cleber Machado', '12345-789', '20A', 'casa');
INSERT INTO Pessoa (cpf, nome, cep, numero, comp) VALUES ('56847589102', 'Valquiria Reis', '54321-789', '485B', 'apto');
INSERT INTO Pessoa (cpf, nome, cep, numero, comp) VALUES ('12345678900', 'Manoel Cebola', '12345-987', '13', 'casa');
INSERT INTO Pessoa (cpf, nome, cep, numero, comp) VALUES ('23456780000', 'Catarina Vlander', '12345-000', '25', 'casa');
INSERT INTO Pessoa (cpf, nome, cep, numero, comp) VALUES ('45870000000', 'Carol Leticia', '02468-123', '40B', 'apto');

INSERT INTO Telefones (cpf, num_tel) VALUES ('70292933479', '81988024567');
INSERT INTO Telefones (cpf, num_tel) VALUES ('56847589102', '81934724568');
INSERT INTO Telefones (cpf, num_tel) VALUES ('12345678900', '51994457201');
INSERT INTO Telefones (cpf, num_tel) VALUES ('23456780000', '51997755240');
INSERT INTO Telefones (cpf, num_tel) VALUES ('45870000000', '81997002852');

INSERT INTO Funcionario (id_func, turno, salario) VALUES ('56847589102','INTEGRAL', 500000);
INSERT INTO Funcionario (id_func, turno, salario) VALUES ('12345678900',   'MANHÃ', 160000);
INSERT INTO Funcionario (id_func, turno, salario) VALUES ('23456780000','INTEGRAL', 360000);
INSERT INTO Funcionario (id_func, turno, salario) VALUES ('45870000000',   'NOITE', 200000);

INSERT INTO Vendedor (id_func) VALUES ('56847589102');
INSERT INTO Vendedor (id_func) VALUES ('12345678900');
INSERT INTO Vendedor (id_func) VALUES ('23456780000');
INSERT INTO Vendedor (id_func) VALUES ('45870000000');

INSERT INTO Visitante (id_visi) VALUES ('70292933479');

INSERT INTO Dia_preco (dia_evento, preco) VALUES (TO_DATE('29-01-2023','DD-MM-YYYY'), 2500);

INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 01, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 02, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 03, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 04, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 05, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 06, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 07, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 08, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 09, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 10, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 11, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 12, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 13, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 14, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 15, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 16, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 17, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 18, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 19, TO_DATE('29-01-2023','DD-MM-YYYY'));
INSERT INTO Ingresso (id_comprad, num_ingresso, dia_evento) VALUES ('70292933479', 20, TO_DATE('29-01-2023','DD-MM-YYYY'));

INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 01, '23456780000');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 02, '23456780000');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 03, '12345678900');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 04, '45870000000');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 05, '12345678900');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 07, '45870000000');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 08, '12345678900');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 09, '56847589102');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 10, '56847589102');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 11, '45870000000');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 12, '12345678900');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 13, '56847589102');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 14, '45870000000');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 15, '56847589102');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 16, '45870000000');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 17, '56847589102');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 18, '12345678900');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 19, '56847589102');
INSERT INTO Compra (id_visitant, num_ingresso, vendedor) VALUES ('70292933479', 20, '12345678900');
/

-- DECLARACAO DA VIEW
CREATE OR REPLACE VIEW num_vendas AS
SELECT V.id_func,
       COUNT(C.num_ingresso) AS ingressos_vendidos,
       SUM(P.preco) AS total_vendas
FROM Vendedor V
LEFT JOIN Funcionario F ON V.id_func = F.id_func
LEFT JOIN Compra C ON F.id_func = C.vendedor
LEFT JOIN Ingresso I ON C.id_visitant = I.id_comprad AND C.num_ingresso = I.num_ingresso
LEFT JOIN Dia_preco P ON I.dia_evento = P.dia_evento
GROUP BY V.id_func;

SELECT * FROM num_vendas ;