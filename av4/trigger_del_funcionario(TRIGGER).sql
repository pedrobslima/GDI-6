CREATE OR REPLACE TRIGGER trigger_del_funcionario
BEFORE DELETE ON Funcionario
FOR EACH ROW
BEGIN    
    BEGIN
        DELETE FROM Vendedor WHERE id_func = :OLD.id_func;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'O funcionário não pode ser excluído pois ainda há vendas em seu nome. Delete as compras correspondentes ao funcionario de id_func-'||:OLD.id_func||'.');
    END;
    
    BEGIN
        DELETE FROM Manutencao WHERE id_func = :OLD.id_func;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'O funcionário não pode ser excluído pois ainda está encarregado de equipamentos. Delete os equipamentos relacionados ao funcionario de id_func-'||:OLD.id_func||'.');
    END;

    BEGIN
        DELETE FROM Tecnico WHERE id_func = :OLD.id_func;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'O funcionário não pode ser excluído pois ainda está responsável por shows. Delete os shows relacionados ao funcionario de id_func-'||:OLD.id_func||'.');
    END;
END;
/
