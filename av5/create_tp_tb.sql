-- DROP TYPES:
/*
    DROP TYPE tp_garantir_acesso;
    DROP TYPE tp_show;
    DROP TYPE tp_cronograma;
    -- NAO SEI SE É NECESSARIO, MAS colaborante É DO TIPO tp_atracao 
    ALTER TYPE tp_atracao MODIFY ATTRIBUTE (colaborante);
    DROP TYPE tp_atracao;
    DROP TYPE tp_contatos;
    DROP TYPE tp_disponibiliza;
    DROP TYPE tp_palco;
    DROP TYPE tp_encarrega;
    DROP TYPE tp_equipamento;
    DROP TYPE tp_nome_preco;
    DROP TYPE tp_compra;
    DROP TYPE tp_ingresso;
    DROP TYPE tp_dia_preco;
    DROP TYPE tp_visitante;
    DROP TYPE tp_vendedor;
    DROP TYPE tp_tecnico;
    DROP TYPE tp_manutencao;
    DROP TYPE tp_funcionario;
    DROP TYPE tp_pessoa;
    DROP TYPE tp_endereco;
    DROP TYPE tp_telefone;
*/
-- TIPOS:

CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep VARCHAR2(9), 
    rua VARCHAR2(30), 
    cidade VARCHAR2(30), 
    pais VARCHAR2(30), 
    estado VARCHAR2(20)
 	
);
/

CREATE TYPE varray_telefone AS VARRAY (3) OF VARCHAR(13); 
/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    cpf CHAR(11),
    nome VARCHAR2(40),
    endereco REF tp_endereco,
    numero VARCHAR(5),
    comp VARCHAR(5),
    telefone varray_telefone,  
	CONSTRUCTOR FUNCTION tp_pessoa(SELF IN OUT tp_pessoa, cpf CHAR, nome VARCHAR2, endereco REF tp_endereco, numero VARCHAR, comp VARCHAR, telefone varray_telefone) RETURN SELF AS RESULT,
    MEMBER FUNCTION get_cpf RETURN CHAR,
    MEMBER PROCEDURE exibirDetalhesPessoa,
    FINAL MEMBER PROCEDURE exibirNomeECpf

)NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE BODY tp_pessoa AS 
    CONSTRUCTOR FUNCTION tp_pessoa(SELF IN OUT tp_pessoa, cpf CHAR, nome VARCHAR2, endereco REF tp_endereco, numero VARCHAR, comp VARCHAR, telefone varray_telefone) RETURN SELF AS RESULT IS
    BEGIN
    	SELF.cpf := cpf;
		SELF.nome := nome;
		SELF.endereco := endereco;
		SELF.numero := numero;
		SELF.comp := comp;
		SELF.telefone := telefone;
		RETURN;
	END;
    MEMBER FUNCTION get_cpf RETURN CHAR IS -- feita
    BEGIN 
        RETURN SELF.cpf; 
    END; 
	MEMBER PROCEDURE exibirDetalhesPessoa IS -- feita
        endereco_obj tp_endereco;
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('CPF: ' || SELF.cpf); 
        DBMS_OUTPUT.PUT_LINE('Nome: ' || SELF.nome); 
        
        -- Correção: Use SELF.endereco para acessar a referência de endereço
        SELECT DEREF(SELF.endereco) INTO endereco_obj FROM DUAL;
        
        DBMS_OUTPUT.PUT_LINE('CEP: ' || endereco_obj.cep); 
        DBMS_OUTPUT.PUT_LINE('Número: ' || SELF.numero); 
        DBMS_OUTPUT.PUT_LINE('Complemento: ' || SELF.comp); 
    END;
	FINAL MEMBER PROCEDURE exibirNomeECpf IS -- feita
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('CPF: ' || SELF.cpf); 
        DBMS_OUTPUT.PUT_LINE('Nome: ' || SELF.nome); 
    END;
END; 
/

---------------------------------------------------------------------------------^

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa(
    turno VARCHAR2(8),
    salario NUMBER
)NOT FINAL NOT INSTANTIABLE;
/
---------------------------------------------------------------------------------^
CREATE OR REPLACE TYPE tp_manutencao UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_tecnico UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_vendedor UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_visitante UNDER tp_pessoa ();
/

CREATE OR REPLACE TYPE tp_dia_preco AS OBJECT( 
    dia_evento DATE,
    preco NUMBER,
    MAP MEMBER FUNCTION venda_total RETURN INTEGER 
);
/

CREATE OR REPLACE TYPE tp_ingresso AS OBJECT(
    id_comprad tp_visitante,
    num_ingresso INTEGER,
    dia_evento REF tp_dia_preco
);
/

CREATE TABLE tb_ingresso OF tp_ingresso(
    PRIMARY KEY(id_comprad.cpf, num_ingresso)
);
/

CREATE OR REPLACE TYPE BODY tp_dia_preco AS 
    MAP MEMBER FUNCTION venda_total RETURN INTEGER IS -- feita
        total_ingressos INTEGER := 0;
    BEGIN        
        SELECT COUNT(*) INTO total_ingressos
        FROM tb_ingresso i
        WHERE i.dia_evento.dia_evento = SELF.dia_evento;
        
        RETURN total_ingressos * SELF.preco;
    END;
END;
/

CREATE OR REPLACE TYPE tp_compra AS OBJECT( 
    ingresso tp_ingresso,
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
    manutencao tp_manutencao,
    equipamento tp_equipamento
);
/

CREATE OR REPLACE TYPE tp_palco AS OBJECT(
    numero NUMBER,
    tamanho VARCHAR2(9)
);
/

CREATE OR REPLACE TYPE tp_disponibiliza AS OBJECT(
    palco tp_palco,
    equipamento tp_equipamento
);
/

CREATE TYPE varray_contatos AS VARRAY (5) OF VARCHAR2(50);
/

CREATE OR REPLACE TYPE tp_cronograma AS OBJECT(
    data_hora_inicio DATE, -- <DD/MM HH:mm> (dps mudar para TIMESTAMP)
    data_hora_termino DATE
);
/

CREATE TYPE tp_nt_cronograma AS TABLE OF tp_cronograma;
/

CREATE OR REPLACE TYPE tp_atracao AS OBJECT(
    nome VARCHAR2(30),
    cache NUMBER,
    contatos varray_contatos,
    cronograma tp_nt_cronograma,
    CONSTRUCTOR FUNCTION tp_atracao(SELF IN OUT tp_atracao, nome VARCHAR2, cache NUMBER, contatos varray_contatos, cronograma tp_nt_cronograma) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION has_higher_pay (a tp_atracao) RETURN INTEGER--,
    --MAP MEMBER FUNCTION pay_per_show RETURN REAL
);
/
CREATE OR REPLACE TYPE BODY tp_atracao AS 
    CONSTRUCTOR FUNCTION tp_atracao(SELF IN OUT tp_atracao, nome VARCHAR2, cache NUMBER, contatos varray_contatos, cronograma tp_nt_cronograma) RETURN SELF AS RESULT IS
    BEGIN
    	SELF.nome := nome;
		SELF.cache := cache;
		SELF.contatos := contatos;
		SELF.cronograma := cronograma;
    END;
    ORDER MEMBER FUNCTION has_higher_pay (a tp_atracao) RETURN INTEGER IS -- feita
    BEGIN 
        IF cache > a.cache THEN
        RETURN 1;
        ELSE 
        RETURN 0;
        END IF;
    END has_higher_pay;
    /*
	MAP MEMBER FUNCTION pay_per_show RETURN REAL IS
        num_shows NUMBER;
    BEGIN
        SELECT COUNT(*) INTO num_shows FROM TABLE (SELF.cronograma);
		IF num_shows = 0 THEN
            num_shows := 1;
        END IF;
		RETURN (SELF.cache)/num_shows;
    END pay_per_show;
    */
END;
/

ALTER TYPE tp_atracao ADD ATTRIBUTE (colaborante REF tp_atracao);
/

CREATE OR REPLACE TYPE tp_show AS OBJECT(
    atracao tp_atracao,
    palco tp_palco,
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

CREATE TABLE tb_funcionario OF tp_funcionario(
    cpf PRIMARY KEY
);
/

CREATE TABLE tb_manutencao OF tp_manutencao(
    cpf PRIMARY KEY
);
/

CREATE TABLE tb_tecnico OF tp_tecnico(
    cpf PRIMARY KEY
);
/

CREATE TABLE tb_vendedor OF tp_vendedor(
    cpf PRIMARY KEY
);
/

CREATE TABLE tb_visitante OF tp_visitante(
    cpf PRIMARY KEY
);
/

CREATE TABLE tb_dia_preco OF tp_dia_preco(
    dia_evento PRIMARY KEY,
    preco NOT NULL
);
/


CREATE TABLE tb_compra OF tp_compra(
    PRIMARY KEY(ingresso.id_comprad.cpf, ingresso.num_ingresso),
    vendedor SCOPE IS tb_vendedor  
);
/

CREATE TABLE tb_nome_preco OF tp_nome_preco(
    nome PRIMARY KEY,
    preco NOT NULL
);
/

CREATE TABLE tb_equipamento OF tp_equipamento(
    num_serie PRIMARY KEY
);
/

CREATE TABLE tb_encarrega OF tp_encarrega(
    PRIMARY KEY(manutencao.cpf, equipamento.num_serie)
);
/

CREATE TABLE tb_palco OF tp_palco(
    numero PRIMARY KEY
);
/

CREATE TABLE tb_disponibiliza OF tp_disponibiliza(  
    PRIMARY KEY(palco.numero, equipamento.num_serie)
);
/

CREATE TABLE tb_atracao OF tp_atracao(
    nome PRIMARY KEY
) NESTED TABLE cronograma STORE AS tb_nt_cronograma;
/

--SELECT A.pay_per_show() AS Pay_per_Show FROM tb_atracao A WHERE A.nome = 'King Crimson';

CREATE TABLE tb_show OF tp_show( 
    PRIMARY KEY(atracao.nome, palco.numero, horario),
    id_tecn SCOPE IS tb_tecnico 
) NESTED TABLE atracao.cronograma STORE AS tb_nt_atrac_crono;
/

CREATE TABLE tb_garantir_acesso OF tp_garantir_acesso(
    PRIMARY KEY(show.atracao.nome, show.palco.numero, show.horario, ingresso.id_comprad.cpf, ingresso.num_ingresso)
) NESTED TABLE show.atracao.cronograma STORE AS tb_nt_show_crono;
/
