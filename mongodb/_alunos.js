db.alunos.insertMany([
   {
       nome: "Felipe Tavares",
       cpf: "555666777-88",
       aniversario: new Date("1996-12-17"),
       cursos:[{
           idioma: "chines",
           progresso: 0.5,
           ult_atividade: 2
           },{
           idioma: "ingles",
           progresso: 0.7,
           ult_atividade: 5
       }],
   }]);