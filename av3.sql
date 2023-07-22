DROP TABLE Endereco;
DROP TABLE Pessoa;
DROP TABLE Telefones;
DROP TABLE Funcionario;
DROP TABLE Tecnico;
DROP TABLE Vendedor;
DROP TABLE Visitante;
DROP TABLE Dia_preco;
DROP TABLE Ingresso;
DROP TABLE Compra;
DROP TABLE Nome_equipamento;
DROP TABLE Equipamentos;
DROP TABLE Encarrega;
DROP TABLE Palco;
DROP TABLE Disponibiliza;
DROP TABLE Atracao;
DROP TABLE Contatos;
DROP TABLE Cronograma;
DROP TABLE Show;
DROP TABLE Garantir_acesso;

CREATE TABLE Endereco ( 
    cep NUMBER NOT NULL, 
    rua VARCHAR2(30), 
    cidade VARCHAR2(30), 
    pais VARCHAR2(20), 
    estado VARCHAR2(20), 
    CONSTRAINT endereco_pkey PRIMARY KEY (cep));

CREATE TABLE Pessoa(
    cpf CHAR(11),
    nome VARCHAR2(40),
    cep NUMBER NOT NULL,
    numero VARCHAR(5),
    comp VARCHAR(2),
    CONSTRAINT pessoa_pkey PRIMARY KEY (cpf),
    CONSTRAINT pessoa_fkey FOREIGN KEY (cep) REFERENCES Endereco(cep)
);

CREATE TABLE Telefones(
    cpf CHAR(11),
    num_tel VARCHAR(13),
    CONSTRAINT telefones_pkey PRIMARY KEY (cpf, num_tel),
    CONSTRAINT telefones_fkey FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Funcionario(
    id_func CHAR(11),
    turno VARCHAR2(8) NOT NULL,
    salario NUMBER NOT NULL,
    CONSTRAINT funcionario_pkey PRIMARY KEY (id_func),
    CONSTRAINT funcionario_fkey FOREIGN KEY (id_func) REFERENCES Pessoa(cpf),
    CONSTRAINT funcionario_ck CHECK (turno IN ('MANHÃ', 'TARDE', 'NOITE', 'INTEGRAL'))
);

CREATE TABLE Manutencao (
    id_func CHAR(11),
    CONSTRAINT manutencao_pkey PRIMARY KEY (id_func),
    CONSTRAINT manutencao_fkey FOREIGN KEY (id_func) REFERENCES Funcionario(id_func)
);

CREATE TABLE Tecnico (
    id_func CHAR(11),
    CONSTRAINT tecnico_pkey PRIMARY KEY (id_func),
    CONSTRAINT tecnico_fkey FOREIGN KEY (id_func) REFERENCES Funcionario(id_func)
);

CREATE TABLE Vendedor (
    id_func CHAR(11),
    CONSTRAINT vendedor_pkey PRIMARY KEY (id_func),
    CONSTRAINT vendedor_fkey FOREIGN KEY (id_func) REFERENCES Funcionario(id_func)
);

CREATE TABLE Visitante (
    id_visi CHAR(11),
    CONSTRAINT visitante_pkey PRIMARY KEY (id_visi),
    CONSTRAINT visitante_fkey FOREIGN KEY (id_visi) REFERENCES Pessoa(cpf)
);

CREATE TABLE Dia_preco (
    dia_evento DATE NOT NULL,
    preco NUMBER,
    CONSTRAINT dia_preco_pkey PRIMARY KEY (dia_evento)
);

CREATE TABLE Ingresso (
    id_comprad CHAR(11),
    num_ingresso INTEGER,
    dia_evento DATE,
    CONSTRAINT ingresso_pkey PRIMARY KEY (id_comprad, num_ingresso),
    CONSTRAINT ingresso_visi_fkey FOREIGN KEY (id_comprad) REFERENCES Visitante(id_visi),
    CONSTRAINT ingresso_dia_fkey FOREIGN KEY (dia_evento) REFERENCES Dia_preco(dia_evento)
);

CREATE TABLE Compra (
    id_visitant CHAR(11), -- iguais Ingresso(cpf que está no ingresso)
    num_ingresso INTEGER, -- diferenciador Ingresso(id diferenciador)
    CONSTRAINT compra_pkey PRIMARY KEY (id_visitant, num_ingresso),
    CONSTRAINT compra_ingresso_fkey FOREIGN KEY (id_visitant, num_ingresso) REFERENCES Ingresso(id_comprad, num_ingresso)
);

CREATE TABLE Nome_equipamento (
    nome VARCHAR2(30),
    preco NUMBER,
    CONSTRAINT nome_equip_pkey PRIMARY KEY (nome)
);

CREATE TABLE Equipamentos (
    num_serie VARCHAR2(30) NOT NULL,
    nome VARCHAR2(30),
    tipo VARCHAR2(10),
    CONSTRAINT equipamentos_pkey PRIMARY KEY (num_serie),
    CONSTRAINT equipamentos_fkey FOREIGN KEY (nome) REFERENCES Nome_equipamento(nome)
);

CREATE TABLE Encarrega (
    id_manut CHAR(11),
    num_serie VARCHAR2(30),
    CONSTRAINT encarrega_pkey PRIMARY KEY (id_manut, num_serie),
    CONSTRAINT encarrega_manut_fkey FOREIGN KEY (id_manut) REFERENCES Manutencao(id_func),
    CONSTRAINT encarrega_equip_fkey FOREIGN KEY (num_serie) REFERENCES Equipamentos(num_serie)
);

CREATE TABLE Palco (
    numero NUMBER,
    tamanho VARCHAR2(9),
    CONSTRAINT palco_pkey PRIMARY KEY (numero)
);

CREATE TABLE Disponibiliza (
    palco NUMBER,
    num_serie VARCHAR2(30),
    CONSTRAINT disponib_pkey PRIMARY KEY (palco, num_serie),
    CONSTRAINT disponib_palco_fkey FOREIGN KEY (palco) REFERENCES Palco(numero),
    CONSTRAINT disponib_equip_fkey FOREIGN KEY (num_serie) REFERENCES Equipamentos(num_serie)
);

CREATE TABLE Atracao (
    nome VARCHAR2(20),
    colaborante VARCHAR2(20),
    cache NUMBER,
    CONSTRAINT atracao_pkey PRIMARY KEY (nome, colaborante),
    CONSTRAINT atracao_fkey FOREIGN KEY (colaborante) REFERENCES Atracao(nome)
);

CREATE TABLE Contatos (
    atracao VARCHAR2(20),
    contatos VARCHAR2(20),
    CONSTRAINT contatos_pkey PRIMARY KEY (atracao, contatos),
    CONSTRAINT contatos_fkey FOREIGN KEY (atracao) REFERENCES Atracao(nome)
);

CREATE TABLE Cronograma (
    atracao VARCHAR2(20),
    data_hora_inicio VARCHAR2(11), -- <DD/MM HH:mm> (dps mudar para TIMESTAMP)
    data_hora_termino VARCHAR2(11),
    CONSTRAINT cronograma_pkey PRIMARY KEY (atracao),
    CONSTRAINT cronograma_fkey FOREIGN KEY (atracao) REFERENCES Atracao(nome)
);

CREATE TABLE Show (
    atracao VARCHAR2(20),
    palco NUMBER,
    horario VARCHAR2(11), -- <HH:mm-HH:mm> (dps mudar para TIMESTAMP)
    id_tecn CHAR(11),
    CONSTRAINT show_pkey PRIMARY KEY (atracao, palco, horario),
    CONSTRAINT show_atracao_fkey FOREIGN KEY (atracao) REFERENCES Atracao(nome),
    CONSTRAINT show_palco_fkey FOREIGN KEY (palco) REFERENCES Palco(numero),
    CONSTRAINT show_tec_pkey FOREIGN KEY (id_tecn) REFERENCES Tecnico(id_func)
);

CREATE TABLE Garantir_acesso (
    atracao VARCHAR2(20),
    num_palco NUMBER,
    horario VARCHAR2(11),
    id_comprad CHAR(11),
    num_ingresso INTEGER,
    CONSTRAINT garAcesso_pkey PRIMARY KEY (atracao, num_palco, horario, id_comprad, num_ingresso),
    CONSTRAINT garAcesso_show_fkey FOREIGN KEY (atracao, num_palco, horario) REFERENCES Show(atracao, palco, horario),
    CONSTRAINT garAcesso_ingresso_fkey FOREIGN KEY (id_comprad, num_ingresso) REFERENCES Ingresso(id_comprad, num_ingresso)
);