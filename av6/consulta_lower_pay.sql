CREATE OR REPLACE PROCEDURE lower_pay(base_name VARCHAR2) IS
    base_atraction tp_atracao;
    curr_atraction tp_atracao;
	CURSOR cs IS (SELECT nome FROM tb_atracao);
	curr_name VARCHAR2(30);
	num_shows INTEGER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Atrações com cache menor do que ' || base_name || ':');
	DBMS_OUTPUT.PUT_LINE('==================================');
    SELECT VALUE(A) INTO base_atraction FROM tb_atracao A WHERE A.nome = base_name;
	OPEN cs;
	LOOP
    	FETCH cs INTO curr_name;
    	EXIT WHEN cs%NOTFOUND;
    	SELECT VALUE(A) INTO curr_atraction FROM tb_atracao A WHERE A.nome = curr_name;
    	IF base_atraction.has_higher_pay(curr_atraction) = 1 THEN -- ORDER MEMBER has_higher_pay (a tp_atracao)
            -- vv Consulta à NESTED TABLE vv
            SELECT COUNT(*) INTO num_shows FROM TABLE (SELECT A.cronograma FROM tb_atracao A WHERE A.nome = curr_name);
    		DBMS_OUTPUT.PUT_LINE('Nome: ' || curr_atraction.nome);
    		DBMS_OUTPUT.PUT_LINE('Cache: R$ ' || curr_atraction.cache);
			DBMS_OUTPUT.PUT_LINE('Número de shows: ' || num_shows);
            DBMS_OUTPUT.PUT_LINE('==================================');
        END IF;
	END LOOP;
	CLOSE cs;
END;
/

EXEC lower_pay('King Crimson');