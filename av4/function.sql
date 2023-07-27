-- DECLARACAO DE TIPO DE TABELA
CREATE OR REPLACE TYPE funcionarios_ AS TABLE OF CHAR(11);
/

-- FUNCAO QUE RETORNA OS SALARIOS MAIORES QUE A MEDIANA
CREATE OR REPLACE FUNCTION maiores_salarios 
RETURN funcionarios_ 
AS 
    resultado funcionarios_; 
    mediana Funcionario.salario%TYPE; 
BEGIN 
    SELECT (MAX(salario)+MIN(salario))/2 INTO mediana FROM Funcionario;  
    SELECT id_func BULK COLLECT INTO resultado FROM Funcionario WHERE salario >= mediana;
    RETURN resultado; 
END maiores_salarios; 
/

-- EXECUCTANDO A FUNCAO
DECLARE
    func_ funcionarios_;
BEGIN
    func_ := maiores_salarios();
    FOR i IN 1..func_.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(func_(i));
    END LOOP;
END;
/
