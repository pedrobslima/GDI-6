-------------------------- TABELA DE VISITANTES --------------------------
SELECT v.visitante.cpf AS CPF,
       v.visitante.nome AS NOME,
       v.visitante.endereco.cep AS CEP,
       v.visitante.endereco.exibir_detalhes() AS ENDERECO,
       v.visitante.get_telefones() AS TELEFONES
FROM tabela_visitantes v;*/

-------------------------- TABELAS DE FUNCIONARIOS --------------------------
SELECT t.funcionario.cpf AS CPF,
       t.funcionario.nome AS NOME,
       t.funcionario.endereco.cep AS CEP,
       t.funcionario.endereco.exibir_detalhes() AS ENDERECO,
       t.funcionario.get_telefones() AS TELEFONES
FROM tabela_tecnicos t;