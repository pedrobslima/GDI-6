CREATE OR REPLACE TYPE BODY tp_endereco AS
    MEMBER FUNCTION exibir_detalhes RETURN VARCHAR2 IS
        result VARCHAR2(100);
    BEGIN
        result := cep || ' (';
        result := result || numero || ', ';
        result := result ||  rua   || ', ';
        result := result || cidade || ', ';
        result := result || estado || ', ';
        result := result ||  pais  || ', ';
        result := result ||  comp  || ')';
        RETURN result;
    END exibir_detalhes;
END;
/

CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER FUNCTION exibir_detalhes RETURN VARCHAR2 IS
        result VARCHAR2(100);
    BEGIN
        result := cpf || ', ' || nome;
        RETURN result;
    END exibir_detalhes;

    MEMBER FUNCTION get_cpf RETURN CHAR IS
    BEGIN
        RETURN cpf;
    END get_cpf;

    MEMBER FUNCTION get_telefones RETURN VARCHAR2 IS
        result VARCHAR2(100);
        telefone_obj tp_telefone;
    BEGIN
        result := '(' || telefone(1);
        
        IF telefone.COUNT = 3 THEN
            result := result || ', ' || telefone(2) || ', ' || telefone(3);
        ELSIF telefone.COUNT = 2 THEN
            result := result || ', ' || telefone(2);
        END IF;
               
        result := result || ')';
        RETURN result;
    END get_telefones;
END;
/