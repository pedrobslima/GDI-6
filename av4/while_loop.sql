-- WHILE LOOP
-- coleta dados dos primerios 10 ingressos e exibe eles
DECLARE
    v_counter NUMBER := 1;
    v_total_ingressos NUMBER := 10;
    v_id_comprad Ingresso.id_comprad%TYPE;
    v_num_ingresso Ingresso.num_ingresso%TYPE;
    v_dia_evento Ingresso.dia_evento%TYPE;
BEGIN
    WHILE v_counter <= v_total_ingressos LOOP
        -- Selecionar as informações do ingresso atual
        SELECT id_comprad, num_ingresso, dia_evento
        INTO v_id_comprad, v_num_ingresso, v_dia_evento
        FROM Ingresso
        WHERE num_ingresso = v_counter;

        -- Exibir as informações do ingresso
        DBMS_OUTPUT.PUT_LINE('Número do Ingresso: ' || v_num_ingresso);
      
        DBMS_OUTPUT.PUT_LINE('ID do Comprador: ' || v_id_comprad);
        DBMS_OUTPUT.PUT_LINE('Dia do Evento: ' || v_dia_evento);
        DBMS_OUTPUT.PUT_LINE('---------------------------');

        v_counter := v_counter + 1;
    END LOOP;
END;
/