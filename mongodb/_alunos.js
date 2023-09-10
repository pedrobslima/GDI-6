db.alunos.insertMany([
    {
       nome: "Felipe Tavares",
       cpf: "555666777-88",
       nascimento: new Date("1996-12-17"),
       avaliacoes: [
          {
             turma: "chines-intermediario-2023-1",
             atividade: "teste de audição",
             nota: 3.5,
             data: new Date("2023-03-25")
          },
          {
             turma: "chines-intermediario-2023-1",
             atividade: "projeto de escrita",
             nota: 3,
             data: new Date("2023-06-15")
          },
          {
             turma: "italiano-iniciante-2023-1",
             atividade: "prova 1",
             nota: 1.3,
             data: new Date("2023-02-10")
          }
       ]
    },
    {
       nome: "Lucas Santos",
       cpf: "918118181-17",
       nascimento: new Date("1999-08-05"),
       avaliacoes: [
          {
             turma: "espanhol-avancado-2023-1",
             atividade: "teste prático",
             nota: 4.2,
             data: new Date("2023-04-25")
          },
          {
             turma: "espanhol-avancado-2023-1",
             atividade: "projeto de pesquisa",
             nota: 3.7,
             data: new Date("2023-07-10")
          },
          {
             turma: "frances-iniciante-2023-1",
             atividade: "prova 1",
             nota: 2.8,
             data: new Date("2023-02-20")
          }
       ]
    },
    {
       nome: "Patrícia Silva",
       cpf: "828289595-47",
       nascimento: new Date("1998-05-20"),
       avaliacoes: [
          {
             turma: "espanhol-intermediario-2023-1",
             atividade: "teste oral",
             nota: 3.9,
             data: new Date("2023-03-10")
          },
          {
             turma: "espanhol-intermediario-2023-1",
             atividade: "apresentação",
             nota: 3.5,
             data: new Date("2023-05-05")
          },
          {
             turma: "frances-iniciante-2023-1",
             atividade: "trabalho em grupo",
             nota: 3.2,
             data: new Date("2023-04-15")
          }
       ]
    },
    {
       nome: "Mariana Oliveira",
       cpf: "141241414-24",
       nascimento: new Date("1997-09-14"),
       avaliacoes: [
          {
             turma: "espanhol-avancado-2023-1",
             atividade: "exame final",
             nota: 4.7,
             data: new Date("2023-07-25")
          },
          {
             turma: "espanhol-avancado-2023-1",
             atividade: "projeto de pesquisa",
             nota: 3.9,
             data: new Date("2023-07-10")
          },
          {
             turma: "italiano-iniciante-2023-1",
             atividade: "prova 1",
             nota: 2.5,
             data: new Date("2023-02-10")
          }
       ]
    },
    {
       nome: "Luiz Garcia",
       cpf: "523525252-53",
       nascimento: new Date("1998-03-08"),
       avaliacoes: [
          {
             turma: "espanhol-intermediario-2023-1",
             atividade: "teste oral",
             nota: 3.8,
             data: new Date("2023-03-10")
          },
          {
             turma: "espanhol-intermediario-2023-1",
             atividade: "apresentação",
             nota: 3.6,
             data: new Date("2023-05-05")
          },
          {
             turma: "frances-iniciante-2023-1",
             atividade: "trabalho em grupo",
             nota: 3.3,
             data: new Date("2023-04-15")
          }
       ]
    }
 ])
 