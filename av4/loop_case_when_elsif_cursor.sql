-- LOOP, CASE WHEN, ELSIF e CURSOR
DECLARE 
    v_atracao show.atracao%TYPE;
    v_palco show.palco%TYPE;
    v_horario show.horario%TYPE;
    v_idtec show.id_tecn%TYPE;

    CURSOR c_show IS 
        SELECT atracao, palco, horario, id_tecn FROM show
        ORDER BY id_tecn;

BEGIN
    OPEN c_show;
    LOOP
        FETCH c_show INTO v_atracao, v_palco, v_horario, v_idtec;

        CASE v_palco
            WHEN '1' THEN
                IF v_idtec = '22307947437' THEN
                    DBMS_OUTPUT.PUT_LINE('Nome da atração alocada ao palco 1: ' || v_atracao);
                    DBMS_OUTPUT.PUT_LINE('Horario: ' || v_horario);
                END IF;
            WHEN '2' THEN
                IF v_idtec = '22307947437' THEN
                    DBMS_OUTPUT.PUT_LINE('Nome da atração alocada ao palco 2: ' || v_atracao);
                    DBMS_OUTPUT.PUT_LINE('Horario: ' || v_horario);
                END IF;
            WHEN '3' THEN
                DBMS_OUTPUT.PUT_LINE('Palco 3: ' || v_atracao || ' - Horario: ' || v_horario);
            ELSE
                DBMS_OUTPUT.PUT_LINE('Buscando...');
        END CASE;
        
        EXIT WHEN c_show%NOTFOUND; -- LOOP EXIT WHEN
    END LOOP;
    
    CLOSE c_show;
END;
/
