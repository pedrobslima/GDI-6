ALTER TABLE Funcionario ADD (CONSTRAINT funcionario_pay_ck CHECK (salario >= 1320));

-- Farei uma indexação dos equipamentos para que uma consulta de tipos de equipamentos
-- específicos sejam feitos mais facilmente
-- Tbm farei um parecido para os ingressos
CREATE INDEX type_idx ON Equipamentos(tipo, nome)

CREATE INDEX id_idx ON Ingresso(id_comprad)

-- mostrar quais vendedores do turno da manhã venderam ingressos pra cada dia: 

SELECT I.dia_evento, V.id_func
    FROM Ingresso I 
    INNER JOIN Compra C 
    ON C.id_visitant = I.id_comprad AND C.num_ingresso = I.num_ingresso
    INNER JOIN Vendedor V
    ON V.id_func = C.vendedor
    INNER JOIN Funcionario F
    ON F.id_func = V.id_func
    WHERE EXISTS C.vendedor = V.id_func AND F.turno = 'MANHÃ'


