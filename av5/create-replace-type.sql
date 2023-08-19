CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cidade varchar(20),
    rua varchar(20),
    numero number,
    estado varchar(10),
    pais varchar(10),
 	-- falta complemento que eh multivalorado 
);
CREATE OR REPLACE TYPE tp_telefone as object (
    numero varchar(12)
);

CREATE OR REPLACE TYPE tp_pessoa as object(
    cpf varchar(12),
    nome varchar(12),
    telefone ARRAY REF tp_telefone -- seria um array? 
    endereco REF tp_endereco
)NOT FINAL NOT INSTANTIABLE;


CREATE TABLE tp_funcionario UNDER tp_pessoa(
    turno varchar(6),
    salario float
    -- criar uma funcao exibir dados de um funcionario

)NOT FINAL;