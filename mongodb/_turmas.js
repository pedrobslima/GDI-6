db.turmas.insertMany([
    {
       lingua: "francês",
       nivel: "iniciante",
       descricao: "frances-iniciante-2023-1",
       inicio: new Date("2023-01-10"),
       termino: new Date("2023-04-30"),
       professor: "789012345-67",
       alunos: [
          "555666777-88",
          "123987456-11",
          "888777666-55"
       ],
       atividades: [
          {
             descricao: "prova 1",
             peso: 4,
             data: new Date("2023-02-20")
          },
          {
             descricao: "trabalho em grupo",
             peso: 3,
             data: new Date("2023-04-15")
          },
          {
             descricao: "prova final",
             peso: 3,
             data: new Date("2023-04-28")
          }
       ]
    },
    {
       lingua: "alemão",
       nivel: "intermediário",
       descricao: "alemao-intermediario-2023-1",
       inicio: new Date("2023-02-05"),
       termino: new Date("2023-06-25"),
       professor: "111222333-44",
       alunos: [
          "555666777-88",
          "123987456-11",
          "548452525-78",
          "918118181-17"
       ],
       atividades: [
          {
             descricao: "exame escrito",
             peso: 4,
             data: new Date("2023-03-15")
          },
          {
             descricao: "apresentação oral",
             peso: 3,
             data: new Date("2023-05-20")
          },
          {
             descricao: "projeto final",
             peso: 3,
             data: new Date("2023-06-15")
          }
       ]
    },
    {
       lingua: "espanhol",
       nivel: "avançado",
       descricao: "espanhol-avancado-2023-1",
       inicio: new Date("2023-03-15"),
       termino: new Date("2023-07-30"),
       professor: "555444333-22",
       alunos: [
          "828289595-47",
          "141241414-24",
          "523525252-53"
       ],
       atividades: [
          {
             descricao: "teste prático",
             peso: 4,
             data: new Date("2023-04-25")
          },
          {
             descricao: "projeto de pesquisa",
             peso: 3,
             data: new Date("2023-07-10")
          },
          {
             descricao: "exame final",
             peso: 3,
             data: new Date("2023-07-25")
          }
       ]
    },
    {
       lingua: "italiano",
       nivel: "iniciante",
       descricao: "italiano-iniciante-2023-1",
       inicio: new Date("2023-01-20"),
       termino: new Date("2023-05-10"),
       professor: "123789456-11",
       alunos: [
          "888777666-55",
          "555666777-88",
          "918118181-17",
          "123987456-11"
       ],
       atividades: [
          {
             descricao: "prova 1",
             peso: 4,
             data: new Date("2023-02-10")
          },
          {
             descricao: "apresentação cultural",
             peso: 3,
             data: new Date("2023-04-05")
          },
          {
             descricao: "prova final",
             peso: 3,
             data: new Date("2023-05-05")
          }
       ]
    },
    {
       lingua: "chinês",
       nivel: "intermediário",
       descricao: "chines-intermediario-2023-1",
       inicio: new Date("2023-02-10"),
       termino: new Date("2023-06-30"),
       professor: "789012345-67",
       alunos: [
          "555666777-88",
          "828289595-47",
          "918118181-17",
          "123987456-11",
          "548452525-78"
       ],
       atividades: [
          {
             descricao: "teste de audição",
             peso: 4,
             data: new Date("2023-03-25")
          },
          {
             descricao: "projeto de escrita",
             peso: 3,
             data: new Date("2023-06-15")
          },
          {
             descricao: "exame final",
             peso: 3,
             data: new Date("2023-06-25")
          }
       ]
    }
 ])
 