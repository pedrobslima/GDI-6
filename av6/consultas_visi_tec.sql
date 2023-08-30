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
/

-- Todos os funcionários q moram em Pernambuco:   vvvvvvvvvvvvv SELECT REF
SELECT nome FROM tb_manutencao WHERE endereco IN (SELECT REF(E) FROM tb_endereco E WHERE E.estado = 'Pernambuco')
UNION
SELECT nome FROM tb_vendedor WHERE endereco IN (SELECT REF(E) FROM tb_endereco E WHERE E.estado = 'Pernambuco')
UNION
SELECT nome FROM tb_tecnico WHERE endereco IN (SELECT REF(E) FROM tb_endereco E WHERE E.estado = 'Pernambuco')
/