-- TIPOS:

CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep VARCHAR2(9), 
    rua VARCHAR2(30), 
    cidade VARCHAR2(30), 
    pais VARCHAR2(30), 
    estado VARCHAR2(20)
 	
);
/

CREATE OR REPLACE TYPE tp_telefone as object (
    cpf CHAR(11),
    num_tel VARCHAR(13)
);
/

CREATE OR REPLACE TYPE tp_pessoa as object(
    cpf CHAR(11),
    nome VARCHAR2(40),
    cep VARCHAR2(9),
    numero VARCHAR(5),
    comp VARCHAR(5),

    telefone tp_telefone,  
    endereco REF tp_endereco

)NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa(
    turno varchar(6),
    salario number
    -- criar uma funcao exibir dados de um funcionario

)NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE tp_manutencao UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_tecnico UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_vendedor UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_visitante UNDER tp_pessoa();
/

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

CREATE OR REPLACE TYPE tp_nome_equipamento AS OBJECT(
    nome VARCHAR2(30),
    preco NUMBER
);
/

CREATE OR REPLACE TYPE tp_equipamento AS OBJECT(
    num_serie VARCHAR(30),
    nome_preco tp_nome_equipamento,
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
    id_tecn tp_tecnico
);
/

CREATE OR REPLACE TYPE tp_garantir_acesso AS OBJECT(
    show tp_show,
    ingresso tp_ingresso
);
/

-- TABELAS:

CREATE TABLE tb_endereco of tp_endereco(
    CONSTRAINT tb_endereco_pkey PRIMARY KEY(cep)
);
/

CREATE TABLE tb_pessoa OF tp_pessoa(
    CONSTRAINT tb_pessoa_pkey PRIMARY KEY (cpf),
    endereco WITH ROWID REFERENCES tb_endereco
);
/