-- TIPOS:

CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep VARCHAR2(9), 
    rua VARCHAR2(30), 
    cidade VARCHAR2(30), 
    pais VARCHAR2(30), 
    estado VARCHAR2(20)
 	
);
/

CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    num_tel VARCHAR(13)
);
/

CREATE TYPE varray_telefone (3) OF tp_telefone;
/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    cpf CHAR(11),
    nome VARCHAR2(40),
    cep VARCHAR2(9),
    numero VARCHAR(5),
    comp VARCHAR(5),

    telefone varray_telefone,  
    endereco REF tp_endereco,

    MEMBER PROCEDURE exibirDetalhesPessoa,
    MEMBER FUNCTION get_cpf RETURN CHAR

)NOT FINAL NOT INSTANTIABLE;
/
---------------------------------------------------------------------------------v
CREATE OR REPLACE TYPE BODY tp_pessoa AS

   MEMBER PROCEDURE exibirDetalhesPessoa IS
    
    BEGIN
    DBMS_OUTPUT.PUT_LINE('Detalhes de Pessoa')
    DBMS_OUTPUT.PUT_LINE(SELF.nome)
    DBMS_OUTPUT.PUT_LINE(SELF.cpf)
    DBMS_OUTPUT.PUT_LINE(SELF.cep)
    DBMS_OUTPUT.PUT_LINE(SELF.numero)
    DBMS_OUTPUT.PUT_LINE(SELF.comp)
    
    -- Obtém o objeto de endereço a partir da REF usando uma consulta SQL
    SELECT DEREF(SELF.endereco) INTO endereco_obj FROM DUAL;
    
    DBMS_OUTPUT.PUT_LINE('Detalhes do Endereço:');
    DBMS_OUTPUT.PUT_LINE('CEP: ' || endereco_obj.cep);
    DBMS_OUTPUT.PUT_LINE('Rua: ' || endereco_obj.rua);
    DBMS_OUTPUT.PUT_LINE('Cidade: ' || endereco_obj.cidade);
    DBMS_OUTPUT.PUT_LINE('País: ' || endereco_obj.pais);
    DBMS_OUTPUT.PUT_LINE('Estado: ' || endereco_obj.estado);
   	END;

END;
/
CREATE OR REPLACE TYPE BODY tp_pessoa AS
    -- Implemente a member function que retorna o CPF
    MEMBER FUNCTION get_cpf RETURN CHAR IS
    BEGIN
    	RETURN self.cpf;
    END;
END;
/ 
---------------------------------------------------------------------------------^

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa(
    turno varchar(6),
    salario number
    -- criar uma funcao exibir dados de um funcionario
)NOT FINAL NOT INSTANTIABLE;
/
---------------------------------------------------------------------------------v
CREATE OR REPLACE TYPE BODY tp_funcionario AS

   OVERRIDING MEMBER PROCEDURE exibirDetalhesPessoa IS
    
   BEGIN
    DBMS_OUTPUT.PUT_LINE('Detalhes de Funcionario')
    DBMS_OUTPUT.PUT_LINE(SELF.nome)
    DBMS_OUTPUT.PUT_LINE(SELF.cpf)
    DBMS_OUTPUT.PUT_LINE(SELF.cep)
    DBMS_OUTPUT.PUT_LINE(SELF.numero)
    DBMS_OUTPUT.PUT_LINE(SELF.comp)

    -- Especificacoes de Funcioanrio

    DBMS_OUTPUT.PUT_LINE(SELF.salario)
    DBMS_OUTPUT.PUT_LINE(SELF.turno)

      -- Obtém o objeto de endereço a partir da REF usando uma consulta SQL
      SELECT DEREF(SELF.endereco) INTO endereco_obj FROM DUAL;
      
      DBMS_OUTPUT.PUT_LINE('Detalhes do Endereço:');
      DBMS_OUTPUT.PUT_LINE('CEP: ' || endereco_obj.cep);
      DBMS_OUTPUT.PUT_LINE('Rua: ' || endereco_obj.rua);
      DBMS_OUTPUT.PUT_LINE('Cidade: ' || endereco_obj.cidade);
      DBMS_OUTPUT.PUT_LINE('País: ' || endereco_obj.pais);
      DBMS_OUTPUT.PUT_LINE('Estado: ' || endereco_obj.estado);
      
   END;

END;
/
---------------------------------------------------------------------------------^
CREATE OR REPLACE TYPE tp_manutencao UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_tecnico UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_vendedor UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_visitante UNDER tp_pessoa();
/

/*
CONSTRUCTOR FUNCTION tp_visitante (
    cpf CHAR,
    nome VARCHAR2,
    cep VARCHAR2,
    numero VARCHAR,
    comp VARCHAR,
    telefone REF tp_telefone,
    endereco REF tp_endereco

    ) RETURN SELF AS RESULT IS
    
    BEGIN 

	SELF.cpf := cpf;
	SELF.nome := nome;
	SELF.cep := cep;
	SELF.numero := numero;
	SELF.comp := comp;
	SELF.telefone := telefone;
	SELF.endereco := endereco;
	RETURN;
END;
/
*/

CREATE OR REPLACE TYPE tp_dia_preco AS OBJECT(
    dia_evento DATE,
    preco NUMBER
);
/

CREATE OR REPLACE TYPE tp_ingresso AS OBJECT(
    id_comprad REF tp_visitante,
    num_ingresso INTEGER,
    dia_evento REF tp_dia_preco
);
/

CREATE OR REPLACE TYPE tp_compra AS OBJECT(
    id_visitant REF tp_ingresso,
    num_ingresso REF tp_ingresso,
    vendedor REF tp_vendedor
);
/

CREATE OR REPLACE TYPE tp_nome_preco AS OBJECT(
    nome VARCHAR2(30),
    preco NUMBER
);
/

CREATE OR REPLACE TYPE tp_equipamento AS OBJECT(
    num_serie VARCHAR(30),
    nome REF tp_nome_preco,
    tipo VARCHAR2(20)
);
/

CREATE OR REPLACE TYPE tp_encarrega AS OBJECT(
    id_maut REF tp_manutencao,
    numserie REF tp_equipamento
);
/

CREATE OR REPLACE TYPE tp_palco AS OBJECT(
    numero NUMBER,
    tamanho VARCHAR2(9)
);
/

CREATE OR REPLACE TYPE tp_disponibiliza AS OBJECT(
    palco REF tp_palco,
    num_serie REF tp_equipamento
);
/

CREATE OR REPLACE TYPE tp_contatos AS OBJECT(
    atracao VARCHAR2(30),
    contatos VARCHAR2(50)
); 
/

CREATE OR REPLACE TYPE tp_atracao AS OBJECT(
    nome VARCHAR2(30),
    cache NUMBER,
    contatos tp_contatos
);
/

ALTER TYPE tp_atracao ADD ATTRIBUTE (colaborante REF tp_atracao);
/

CREATE OR REPLACE TYPE tp_cronograma AS OBJECT(
    atracao REF tp_atracao,
    data_hora_inicio DATE, -- <DD/MM HH:mm> (dps mudar para TIMESTAMP)
    data_hora_termino DATE
);
/

CREATE OR REPLACE TYPE tp_show AS OBJECT(
    atracao REF tp_atracao,
    placo REF tp_palco,
    horario VARCHAR2(25),
    id_tecn REF tp_tecnico
);
/

CREATE OR REPLACE TYPE tp_garantir_acesso AS OBJECT(
    show tp_show,
    ingresso tp_ingresso
);
/

-- TABELAS:

CREATE TABLE tb_endereco of tp_endereco(
    cep PRIMARY KEY
);
/

CREATE TABLE tb_pessoa OF tp_pessoa(
    cpf PRIMARY KEY,
    endereco WITH ROWID REFERENCES tb_endereco
);
/
/*
CREATE TABLE tb_visitante OF tp_visitante(
    cpf PRIMARY KEY
);
/
*/