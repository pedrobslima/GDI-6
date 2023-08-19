CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep VARCHAR2(9), 
    rua VARCHAR2(30), 
    cidade VARCHAR2(30), 
    pais VARCHAR2(30), 
    estado VARCHAR2(20)
 	
);

CREATE OR REPLACE TYPE tp_telefone as object (
    cpf CHAR(11),
    num_tel VARCHAR(13)
);

CREATE OR REPLACE TYPE tp_pessoa as object(
    cpf CHAR(11),
    nome VARCHAR2(40),
    cep VARCHAR2(9),
    numero VARCHAR(5),
    comp VARCHAR(5),

    telefone tp_telefone,  
    endereco REF tp_endereco

)NOT FINAL NOT INSTANTIABLE;

CREATE TABLE tb_endereco of tp_endereco(
    CONSTRAINT tb_endereco_pkey PRIMARY KEY(cep)
);

CREATE TABLE tb_pessoa OF tp_pessoa(
    CONSTRAINT tb_pessoa_pkey PRIMARY KEY (cpf),
    endereco WITH ROWID REFERENCES tb_endereco
);


CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa(
    turno varchar(6),
    salario number
    -- criar uma funcao exibir dados de um funcionario

);