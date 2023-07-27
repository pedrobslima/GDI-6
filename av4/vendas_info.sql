-- Tabela para relacionar todas as vendas feitas por cada funcionário
DROP TABLE Vendas_info;

CREATE TABLE Vendas_info(
    id VARCHAR2(11),
    nome VARCHAR2(40),
    turno VARCHAR2(8),
    total INTEGER, -- total é o dinheiro total adquirido pelas vendas
    CONSTRAINT vandeasinfo_pkey PRIMARY KEY (id)
    );

-- INSERT INTO: Povoamento da tabela
INSERT INTO Vendas_info(id, nome, turno, total) 
	SELECT F.id_func, P.nome, F.turno, SUM(DP.preco)
	FROM Compra C
	INNER JOIN Funcionario F -- INNER JOIN
	ON C.vendedor = F.id_func
	INNER JOIN Pessoa P
	ON F.id_func = P.cpf
	INNER JOIN Ingresso I
	ON C.id_visitant = I.id_comprad AND C.num_ingresso = I.num_ingresso
	INNER JOIN Dia_preco DP
	ON I.dia_evento = DP.dia_evento
	GROUP BY F.id_func, P.nome, F.turno; -- GROUP BY
    
-- SELECT-FROM-WHERE e MAX: Dados de quem ganhou mais
SELECT * FROM Vendas_info 
    WHERE total IN ( -- SUBCONSULTA COM IN
    SELECT MAX(total)
    FROM Vendas_info
    );

-- MIN: Dados de quem ganhou menos
SELECT * FROM Vendas_info 
    WHERE total IN (
    SELECT MIN(total)
    FROM Vendas_info
    );

/* UNION: quant de func e média de dinheiro ganho para cada turno 
   + quant de func média de dinheiro ganho em todos os turnos*/
SELECT turno, COUNT(*), AVG(total) FROM Vendas_info -- COUNT e AVG
	GROUP BY turno
UNION
SELECT 'TODOS', COUNT(*), AVG(total) FROM Vendas_info; -- COUNT e AVG

/* mostra todos os func da noite que ganharam mais em vendas 
   doq cada um dos func integrais*/
SELECT * FROM Vendas_info
	WHERE turno = 'NOITE' AND total > ALL ( -- SUBCONSULTA COM ALL E COM OPERD. REL.
    SELECT VI.total
    FROM Vendas_info VI
    WHERE VI.turno = 'INTEGRAL'
    )
    ORDER BY id; -- ORDER BY

/* mostra todos os func integrais que ganharam no mínimo
   o que qualquer um dos func da noite*/
SELECT * FROM Vendas_info
    WHERE turno = 'INTEGRAL' AND total >= ANY ( -- SUBCONSULTA COM ANY
        SELECT VI.total
        FROM Vendas_info VI
        WHERE VI.turno = 'NOITE'
    )
    ORDER BY id; -- ORDER BY