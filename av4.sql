-- levar em conta salário mínimo:

ALTER TABLE Funcionario ADD (CONSTRAINT funcionario_pay_ck CHECK (salario >= 1320));

-- Farei uma indexação dos equipamentos para que uma consulta de tipos de equipamentos
-- específicos sejam feitos mais facilmente
-- Tbm farei um parecido para os ingressos
CREATE INDEX type_idx ON Equipamentos(tipo, nome);

CREATE INDEX id_idx ON Ingresso(id_comprad);

-- mostrar quais vendedores do turno da noite venderam ingressos pra cada dia (não funciona mto bem): 

SELECT V.id_func, I.dia_evento, F.turno
    FROM Ingresso I 
    INNER JOIN Compra C 
    ON C.id_visitant = I.id_comprad AND C.num_ingresso = I.num_ingresso
    INNER JOIN Vendedor V
    ON V.id_func = C.vendedor
    INNER JOIN Funcionario F
    ON F.id_func = V.id_func
    WHERE C.vendedor = V.id_func AND F.turno = 'NOITE'
    GROUP BY I.dia_evento, V.id_func, F.turno
	ORDER BY I.dia_evento, V.id_func;


--___________________________________________________________________


DROP TABLE Vendas_info;

CREATE TABLE Vendas_info(
    id VARCHAR2(11),
    nome VARCHAR2(40),
    turno VARCHAR2(8),
    total INTEGER,
    CONSTRAINT vandeasinfo_pkey PRIMARY KEY (id)
    );

INSERT INTO Vendas_info(id, nome, turno, total)
	SELECT F.id_func, P.nome, F.turno, SUM(DP.preco)
	FROM Compra C
	INNER JOIN Funcionario F
	ON C.vendedor = F.id_func
	INNER JOIN Pessoa P
	ON F.id_func = P.cpf
	INNER JOIN Ingresso I
	ON C.id_visitant = I.id_comprad AND C.num_ingresso = I.num_ingresso
	INNER JOIN Dia_preco DP
	ON I.dia_evento = DP.dia_evento
	GROUP BY F.id_func, P.nome, F.turno;
    
SELECT * FROM Vendas_info 
    WHERE total IN (
    SELECT MAX(total)
    FROM Vendas_info
    );

SELECT * FROM Vendas_info 
    WHERE total IN (
    SELECT MIN(total)
    FROM Vendas_info
    );

/* média de dinheiro ganho para cada turno 
   + média de dinheiro ganho em todos os turnos*/
SELECT turno, AVG(total) FROM Vendas_info
	GROUP BY turno
UNION
SELECT 'TODOS', AVG(total) FROM Vendas_info;

-- mostra todos os func da noite que ganharam mais em vendas 
-- doq cada um dos func integrais
SELECT * FROM Vendas_info
	WHERE turno = 'NOITE' AND total > ALL (
    SELECT VI.total
    FROM Vendas_info VI
    WHERE VI.turno = 'INTEGRAL'
    );

-- mostra todos os func integrais que ganharam no mínimo
-- o que qualquer um dos func da noite
SELECT * FROM Vendas_info
    WHERE turno = 'INTEGRAL' AND total >= ANY (
        SELECT VI.total
        FROM Vendas_info VI
        WHERE VI.turno = 'NOITE'
    );

-- da bonificacao para funcionarios que trabalharam em periodo integral
UPDATE Funcionario
SET salario = salario * 1.25
WHERE turno = 'INTEGRAL';

-- retorna os dados do dono do cpf buscado
DECLARE
  TYPE dados_pessoa IS RECORD (
    id Pessoa.cpf%TYPE,
    nome Pessoa.nome%TYPE,
    cep Pessoa.cep%TYPE
  );
  
  pessoa_info dados_pessoa;
BEGIN
  SELECT cpf, nome, cep
  INTO pessoa_info
  FROM Pessoa
  WHERE cpf = '30603694922';
  
  DBMS_OUTPUT.PUT_LINE('ID: ' || pessoa_info.id);
  DBMS_OUTPUT.PUT_LINE('NOME: ' || pessoa_info.nome);
  DBMS_OUTPUT.PUT_LINE('CEP: ' || pessoa_info.cep);
END;
