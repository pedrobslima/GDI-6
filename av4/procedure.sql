-- Exemplo de criação da procedure
-- Dado um nome de atracao, busca se ela existe na base de dados 
CREATE OR REPLACE PROCEDURE MostrarAtracaoPorShow(atracaoP IN VARCHAR2) IS
BEGIN
    FOR atr IN (SELECT atracao FROM Show WHERE atracao = atracaoP) LOOP
        DBMS_OUTPUT.PUT_LINE('Atracao : ' || atracaoP);
    RETURN;
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma atracao encontrada de nome: ' || atracaoP);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

BEGIN
MostrarAtracaoPorShow('Circo Mágico');
END;
