DECLARE
    v_data_hora_inicio DATE := TO_DATE('2023-07-20 18:00', 'YYYY-MM-DD HH24:MI');
    v_data_hora_termino DATE := TO_DATE('2023-07-23 17:00', 'YYYY-MM-DD HH24:MI');
    v_atracao_nome VARCHAR2(100);

    v_data_esc DATE :=TO_DATE('2023-07-20 18:00', 'YYYY-MM-DD HH24:MI');

BEGIN
    WHILE v_data_esc <=  v_data_hora_termino LOOP
        SELECT atracao, data_hora_inicio, data_hora_termino
        INTO v_atracao_nome, v_data_hora_inicio, v_data_hora_termino
        FROM Cronograma
        WHERE v_data_esc BETWEEN v_data_hora_inicio AND v_data_hora_termino;

        IF v_atracao_nome IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Data: ' || v_data_esc);
            DBMS_OUTPUT.PUT_LINE('Atração: ' || v_atracao_nome);
            DBMS_OUTPUT.PUT_LINE('Início: ' || v_data_hora_inicio);
            DBMS_OUTPUT.PUT_LINE('Término: ' || v_data_hora_termino);
            DBMS_OUTPUT.PUT_LINE('---------------------------');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Data: ' || v_data_esc);
            DBMS_OUTPUT.PUT_LINE('Nenhuma atração agendada para esta data.');
            DBMS_OUTPUT.PUT_LINE('---------------------------');
        END IF;

        v_data_esc := v_data_esc + 1;
    END LOOP;
END;
/