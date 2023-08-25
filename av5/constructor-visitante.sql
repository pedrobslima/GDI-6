CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    cpf CHAR(11),
    num_tel VARCHAR(13)
);
/
CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep VARCHAR2(9), 
    rua VARCHAR2(30), 
    cidade VARCHAR2(30), 
    pais VARCHAR2(30), 
    estado VARCHAR2(20)
 	
);
/
    
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    cpf CHAR(11),
    nome VARCHAR2(40),
    cep VARCHAR2(9),
    numero VARCHAR(5),
    comp VARCHAR(5),

    telefone REF tp_telefone,  
    endereco REF tp_endereco,

    MEMBER PROCEDURE exibirDetalhesPessoa,
    MEMBER FUNCTION get_cpf RETURN CHAR

)NOT FINAL NOT INSTANTIABLE;
/



CREATE OR REPLACE TYPE BODY tp_pessoa AS
    -- Implementação da member function que retorna o CPF
    MEMBER FUNCTION get_cpf RETURN CHAR IS
    BEGIN
        RETURN self.cpf;
    END;

    -- Implementação do procedimento que exibe detalhes da pessoa
    MEMBER PROCEDURE exibirDetalhesPessoa IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('CPF: ' || self.cpf);
        DBMS_OUTPUT.PUT_LINE('Nome: ' || self.nome);
        DBMS_OUTPUT.PUT_LINE('CEP: ' || self.cep);
        DBMS_OUTPUT.PUT_LINE('Número: ' || self.numero);
        DBMS_OUTPUT.PUT_LINE('Complemento: ' || self.comp);

    END;
END;
/

CREATE OR REPLACE TYPE tp_visitante UNDER tp_pessoa();
/



CREATE OR REPLACE TYPE BODY tp_visitante AS
    CONSTRUCTOR FUNCTION tp_visitante (
        v_cpf CHAR,
        v_nome VARCHAR2,
        v_cep VARCHAR2,
        v_numero VARCHAR,
        v_comp VARCHAR,
        v_telefone REF tp_telefone,
        v_endereco REF tp_endereco
    ) RETURN SELF AS RESULT IS
    BEGIN 
        SELF.cpf := v_cpf;
        SELF.nome := v_nome;
        SELF.cep := v_cep;
        SELF.numero := v_numero;
        SELF.comp := v_comp;
        SELF.telefone := v_telefone;
        SELF.endereco := v_endereco;
		--SELF := tp_pessoa(v_cpf, v_nome, v_cep, v_numero, v_comp, v_telefone, v_endereco);
        RETURN;
    END;
END;
/

