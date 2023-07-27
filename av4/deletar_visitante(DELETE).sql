CREATE OR REPLACE PROCEDURE deletar_visitante (id_visi_  Visitante.id_visi%TYPE) IS
        v_is_funcionario NUMBER;
    BEGIN 
        SELECT COUNT(*) INTO v_is_funcionario FROM Funcionario WHERE id_func = id_visi_;

        IF v_is_funcionario > 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Este procedimento não foi feito para deletar funcionarios, apenas visitantes.');
            RETURN;
        END IF;
        
        DELETE FROM Compra WHERE id_visitant = id_visi_;
        DELETE FROM Ingresso WHERE id_comprad = id_visi_;
        DELETE FROM Visitante WHERE id_visi = id_visi_;
        DELETE FROM Telefones WHERE cpf = id_visi_;
        DELETE FROM Pessoa WHERE cpf = id_visi_;
END deletar_visitante;
/