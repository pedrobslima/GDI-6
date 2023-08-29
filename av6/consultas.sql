-------------------------- TABELA DE VISITANTES --------------------------
DECLARE
    visi tp_visitante;
    visi_name VARCHAR2(30);
	CURSOR cs IS SELECT v.cpf FROM tb_visitante v;
BEGIN
    OPEN cs;
	DBMS_OUTPUT.PUT_LINE('=======================================');
	LOOP
    	FETCH cs INTO visi_name;
		EXIT WHEN cs%NOTFOUND;                           --   vvvvvvvv MEMBER FUNCTION get_cpf RETURN CHAR
    	SELECT VALUE(V) INTO visi FROM tb_visitante V WHERE V.get_cpf() = visi_name; 
        visi.exibirDetalhesPessoa(); -- < MEMBER PROCEDURE exibirDetalhesPessoa
		DBMS_OUTPUT.PUT_LINE('=======================================');
	END LOOP;
	CLOSE cs;
END;
/
-------------------------- TABELAS DE FUNCIONARIOS --------------------------

                --    vvvvv-----SELECT DEREF--------vvvvv                               vvvv-Consulta à VARRAY
SELECT T.cpf, T.nome, DEREF(T.endereco).cep AS cep, DEREF(T.endereco).cidade AS cidade, TF.* FROM tb_tecnico T, TABLE (T.telefone) TF;
    
