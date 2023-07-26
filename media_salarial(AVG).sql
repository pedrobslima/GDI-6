CREATE OR REPLACE FUNCTION media_salarial
    	RETURN Funcionario.salario%TYPE
    IS
    	retorno Funcionario.salario%TYPE;
	BEGIN
        SELECT AVG(salario) INTO retorno FROM Funcionario;
		RETURN retorno;
END media_salarial;
/

DECLARE
    aux Funcionario.salario%TYPE;
BEGIN
	aux := media_salarial;
	DBMS_OUTPUT.PUT_LINE(aux);
END;
/
