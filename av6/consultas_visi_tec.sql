-------------------------- TABELA DE VISITANTES --------------------------
DECLARE
    visi tp_visitante;
    visi_cpf VARCHAR2(30);
	CURSOR cs IS SELECT V.cpf FROM tb_visitante V;
BEGIN
    OPEN cs;
	DBMS_OUTPUT.PUT_LINE('=======================================');
	LOOP
    	FETCH cs INTO visi_cpf;
		EXIT WHEN cs%NOTFOUND;                           --   vvvvvvvv MEMBER FUNCTION get_cpf RETURN CHAR
    	SELECT VALUE(V) INTO visi FROM tb_visitante V WHERE V.get_cpf() = visi_cpf; 
        visi.exibirDetalhesPessoa(); -- < MEMBER PROCEDURE exibirDetalhesPessoa
		DBMS_OUTPUT.PUT_LINE('=======================================');
	END LOOP;
	CLOSE cs;
END;
/

	
-- Mostre quantos clientes têm por cep,  e quantos deles tem o cep igual ao de Carlos
SELECT v.nome, DEREF(v.endereco).cep AS CEP, COUNT(*) AS QTD_CEP FROM tb_visitante v
GROUP BY v.nome, DEREF(v.endereco).cep
    HAVING DEREF(v.endereco).cep = (SELECT DEREF(v1.endereco).cep FROM tb_visitante v1
    where v1.nome = 'Carlos');


-------------------------- TABELAS DE FUNCIONARIOS --------------------------

                --    vvvvv-----SELECT DEREF--------vvvvv                               vvvv-Consulta à VARRAY
SELECT T.cpf, T.nome, DEREF(T.endereco).cep AS cep, DEREF(T.endereco).cidade AS cidade, TF.* FROM tb_tecnico T, TABLE (T.telefone) TF;
/

-- Todos os funcionários q moram em Pernambuco:   vvvvvvvvvvvvv-SELECT REF
SELECT nome FROM tb_manutencao WHERE endereco IN (SELECT REF(E) FROM tb_endereco E WHERE E.estado = 'Pernambuco')
UNION
SELECT nome FROM tb_vendedor WHERE endereco IN (SELECT REF(E) FROM tb_endereco E WHERE E.estado = 'Pernambuco')
UNION
SELECT nome FROM tb_tecnico WHERE endereco IN (SELECT REF(E) FROM tb_endereco E WHERE E.estado = 'Pernambuco')
/

-- Todos os funcionários da equipe de manutenção que trabalha em turno integral:
DECLARE 
	func tp_manutencao;
	func_id VARCHAR2(11);
	CURSOR cs IS (SELECT cpf FROM tb_manutencao WHERE turno = 'INTEGRAL');
BEGIN
	OPEN cs;
	LOOP
		FETCH cs INTO func_id;
		EXIT WHEN cs%NOTFOUND;
        SELECT VALUE(F) INTO func FROM tb_manutencao F WHERE F.cpf = func_id;
		func.exibirNomeECpf(); -- < FINAL MEMBER PROCEDURE exibirNomeECpf
		DBMS_OUTPUT.PUT_LINE('==================================');
	END LOOP;
	CLOSE cs;
END;
/
