-- BLOCO ANÔNIMO e %ROWTYPE
-- Insere novos valores em uma nova linha da tabela de Atracao
DECLARE
    v_atracao Atracao%ROWTYPE;
	
BEGIN
    v_atracao.nome := 'Show de Violino';
	v_atracao.colaborante := null;		
	v_atracao.cache := '5000';
         -- Inserção na tabela Atracao
    INSERT INTO Atracao VALUES v_atracao;

	DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso!');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: ' || SQLERRM);

END;
/