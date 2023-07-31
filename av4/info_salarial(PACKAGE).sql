/*
	USO SIMPES DE UM PACKAGE QUE INFORMA
	DADOS BASICOS SOBRE O SALARIO DOS
	FUNCIONARIOS. COMO: media, max e min.
*/

-- DEFINICAO DO PACKGE
CREATE OR REPLACE PACKAGE InfoSalarial AS
    -- FUNCOES
    FUNCTION media RETURN NUMBER;
    FUNCTION max RETURN NUMBER;
    FUNCTION min RETURN NUMBER;
END InfoSalarial;
/

-- DECLARACAO DO BODY
CREATE OR REPLACE PACKAGE BODY InfoSalarial AS
    -- FUNCOES
    FUNCTION media RETURN NUMBER AS
        retorno Funcionario.salario%TYPE;
    BEGIN
        SELECT ROUND(AVG(salario), 0) INTO retorno FROM Funcionario;
        RETURN retorno;
    END media;

	FUNCTION max RETURN NUMBER AS
        retorno Funcionario.salario%TYPE;
    BEGIN
        SELECT MAX(salario) INTO retorno FROM Funcionario;
        RETURN retorno;
    END max;

	FUNCTION min RETURN NUMBER AS
        retorno Funcionario.salario%TYPE;
    BEGIN
        SELECT MIN(salario) INTO retorno FROM Funcionario;
        RETURN retorno;
    END min;
END InfoSalarial;
/

-- EXECUTANDO TESTES
BEGIN
    DBMS_OUTPUT.PUT_LINE('Média salarial: ' || InfoSalarial.media());
    DBMS_OUTPUT.PUT_LINE('Salario MAX:' || InfoSalarial.max());
    DBMS_OUTPUT.PUT_LINE('Salario MIN:' || InfoSalarial.min());
END;
/
