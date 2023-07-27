-- GRANT e REVOKE
GRANT SELECT ON Atracao TO PUBLIC;
REVOKE SELECT ON Atracao FROM PUBLIC;

-- ALTER TABLE: Levar em conta salário mínimo
ALTER TABLE Funcionario ADD (CONSTRAINT funcionario_pay_ck CHECK (salario >= 1320));

/* CREATE INDEX: Farei uma indexação dos equipamentos para que uma consulta 
   de tipos de equipamentos específicos sejam feitos mais facilmente*/
CREATE INDEX type_idx ON Equipamentos(tipo, nome);

-- Tbm farei um parecido para os ingressos
CREATE INDEX id_idx ON Ingresso(id_comprad);


-- UPDATE : Da bonificacao para funcionarios que trabalharam em periodo integral
UPDATE Funcionario
SET salario = salario * 1.25
WHERE turno = 'INTEGRAL';

-- BLOCO ANÔNIMO: Retorna os dados do dono do cpf buscado
DECLARE
  TYPE dados_pessoa IS RECORD ( --USO DE RECORD
    id Pessoa.cpf%TYPE, -- %TYPE
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

-- INSERT INTO
INSERT INTO Pessoa VALUES ('1234', NULL, '87654-320', NULL, NULL);
INSERT INTO Pessoa VALUES ('12345', NULL, '87654-320', NULL, NULL);
INSERT INTO Pessoa VALUES ('123456', NULL, '87654-320', NULL, NULL);

-- DELETE
DELETE FROM Pessoa WHERE nome IS NULL;
