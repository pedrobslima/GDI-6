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

    MEMBER PROCEDURE exibirDetalhesPessoa,
    MEMBER FUNCTION get_cpf RETURN CHAR,
 	MEMBER FUNCTION get_telefones RETURN VARCHAR2,
    FINAL MEMBER PROCEDURE exibirNomeECpf

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

	FINAL MEMBER PROCEDURE exibirNomeECpf IS     
		
	BEGIN         
	DBMS_OUTPUT.PUT_LINE('Nome: ' || SELF.nome)         
	DBMS_OUTPUT.PUT_LINE('CPF: ' || SELF.cpf)         
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
    turno VARCHAR2(6),
    salario NUMBER
    -- criar uma funcao exibir dados de um funcionario
)NOT FINAL NOT INSTANTIABLE;
/
---------------------------------------------------------------------------------v
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
---------------------------------------------------------------------------------^
CREATE OR REPLACE TYPE tp_manutencao UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_tecnico UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_vendedor UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_visitante UNDER tp_pessoa (
    CONSTRUCTOR FUNCTION tp_visitante (
        v_cpf CHAR,
        v_nome VARCHAR2,
        v_cep VARCHAR2,
        v_numero VARCHAR,
        v_comp VARCHAR,
        v_telefone varray_telefone,
        v_endereco REF tp_endereco
    ) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY tp_visitante AS
    CONSTRUCTOR FUNCTION tp_visitante (
        v_cpf CHAR,
        v_nome VARCHAR2,
        v_cep VARCHAR2,
        v_numero VARCHAR,
        v_comp VARCHAR,
        v_telefone varray_telefone,
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
        RETURN;
    END;
END;
/

CREATE OR REPLACE TYPE tp_dia_preco AS OBJECT(
    dia_evento DATE,
    preco NUMBER
);
/

CREATE OR REPLACE TYPE tp_ingresso AS OBJECT(
    id_comprad tp_visitante,
    num_ingresso INTEGER,
    dia_evento REF tp_dia_preco
);
/
/*
CREATE OR REPLACE TYPE tp_compra AS OBJECT(
    id_visitant REF tp_ingresso,
    num_ingresso REF tp_ingresso,
    vendedor REF tp_vendedor
);
/

CREATE OR REPLACE TYPE tp_compra AS OBJECT(
    id_visitant tp_ingresso.id_comprad,
    num_ingresso tp_ingresso.num_ingresso,
    vendedor REF tp_vendedor
);
/
*/
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
    manutencao REF tp_manutencao,
    numserie tp_equipamento
);
/

CREATE OR REPLACE TYPE tp_palco AS OBJECT(
    numero NUMBER,
    tamanho VARCHAR2(9)
);
/

CREATE OR REPLACE TYPE tp_disponibiliza AS OBJECT(
    palco tp_palco,
    num_serie tp_equipamento
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
    cronograma tp_nt_cronograma
);
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
    show REF tp_show,
    ingresso REF tp_ingresso
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

CREATE TABLE tb_ingresso OF tp_ingresso(
    --CONSTRAINT ingresso_pkey PRIMARY KEY (id_comprad, num_ingresso),
    (id_comprad, num_ingresso) PRIMARY KEY
    --id_comprad SCOPE IS tb_visitante
);
/

CREATE TABLE tb_compra OF tp_compra(
    (ingresso.id_comprador, ingresso.num_ingresso) PRIMARY KEY,
    --id_visitant SCOPE IS tb_visitante,
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
    --CONSTRAINT encarrega_pkey PRIMARY KEY (manutencao, num_serie),
    manutencao SCOPE IS tb_manutencao
);
/

CREATE TABLE tb_palco OF tp_palco(
    numero PRIMARY KEY
);
/

CREATE TABLE tb_disponibiliza OF tp_disponibiliza(
    --CONSTRAINT disponib_pkey PRIMARY KEY (palco, num_serie)
);
/

CREATE TABLE tb_atracao OF tp_atracao(
    nome PRIMARY KEY
) NESTED TABLE cronograma STORE AS tb_nt_cronograma;
/

CREATE TABLE tb_show OF tp_show(
    --CONSTRAINT show_pkey PRIMARY KEY (atracao, palco, horario),
    id_tecn SCOPE IS tp_tecnico
);
/
/*
CREATE TABLE tb_garantir_acesso OF tp_garantir_acesso(
    
);
/

-- INSERÇÕES:

INSERT INTO tb_endereco VALUES (
    tp_endereco(
        '52130090',
        'Av. dos Bobos', 
        'Fortaleza',
        'Brasil',
        'Ceara'
    )
);
/

INSERT INTO tb_visitante VALUES (
    tp_visitante(
        '999999999',
        'Claudio',
        (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '52130090'),
        '300',
        '202',
        varray_telefone('83985478965', '83977489654', '83966534789')
    )
);
/

--SELECT V.cpf, V.nome, V.endereco.cep AS cep, V.endereco.cidade AS cidade, V.numero, V.comp, T.* FROM tb_visitante V, TABLE (V.telefone) T;

INSERT INTO tb_atracao VALUES(
    tp_atracao(
        'Megadeth',
        20000,
        varray_contatos(
            '(+12)39867398',
            'megadeth@gmail.com'
        ),
        tp_nt_cronograma(
            tp_cronograma(
                TO_DATE('2023-07-20 18:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-20 20:00', 'YYYY-MM-DD HH24:MI')
                ),
            tp_cronograma(
                TO_DATE('2023-07-21 18:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-21 20:00', 'YYYY-MM-DD HH24:MI')
                ),
            tp_cronograma(
                TO_DATE('2023-07-21 21:00', 'YYYY-MM-DD HH24:MI'), 
                TO_DATE('2023-07-21 22:00', 'YYYY-MM-DD HH24:MI')
                )
        ),
        NULL
    )
);
/

--SELECT A.nome, A.cache, C.* FROM tb_atracao A, TABLE (A.cronograma) C