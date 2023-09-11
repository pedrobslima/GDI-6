// 1 - Seleciona o banco de dados
use('cursos_bd');

// 2 - Consulta o nome dos estudantes que estão aprendendo espanhol, assim como o seu progresso no idioma e o número da última atividade concluída
db.alunos.find({"cursos.idioma":"espanhol"}, {_id:false, "nome":true, "cursos.$":true});

// 3 - Consulta o nome e o progresso atual dos 5 estudantes de inglês mais avançados no idioma ordenados de maneira decrescente
db.alunos.aggregate([{$match:{"cursos.idioma":"inglês"}},{$project:{_id:false, nome:true, cursos:{$filter:{input:"$cursos", as:"curso", cond:{$eq:["$$curso.idioma","inglês"]}}}}},{$unwind:"$cursos"},{$sort:{"cursos.progresso":-1}},{$limit:5}]);

// 4 - Consulta quantos alunos já concluíram ao menos 50% de algum dos cursos disponíveis
db.alunos.find({"cursos.progresso":{$gte:0.5}}, {_id:false, nome:true, "cursos.$":true}).count();

// 5 - Atualiza quantidade de alunos que estudam o idioma francês
db.idiomas.updateOne({lingua:"francês"}, {$set:{qtd_alunos:36}});

// 6 - Retorna a quantidade de alunos que tem o curso com mais pessoas matriculadas
db.idiomas.aggregate([{$group:{_id:null, qtd_max_alunos:{$max:"$qtd_alunos"}}}]).pretty();

// 7 - A consulta cria um índice de texto no campo "descricao" dentro do array "atividades" na coleção "idiomas" e,  em seguida, busca onde pelo menos uma atividade no array "atividades" contenha a palavra "comida" na descrição.
db.idiomas.createIndex({ "atividades.descricao": "text" });
db.idiomas.find({ $text: { $search: "comida" } }, {_id:false, lingua:true});

// 8 - Insere um tema na lista de atividades da lingua ingles 
db.idiomas.updateOne(
    { "lingua": "inglês" },
    {
        $addToSet: {
            "atividades": {
                "tema": "Gírias",
                "descricao": "Aprender gírias em inglês",
                "nivel": "básico",
                "qntd_questoes": 5
            }
        }
    }
);


// 9 - A primeira condição procura por uma pessoa com o nome "Ana", e a segunda condição procura por um cpf que uma das Ana cadastradas podem ter. Em seguida, são projetados os campos "nome" e "cpf" para serem incluídos no resultado da consulta. 
db.alunos.findOne(
    {
        $and: [
            { "nome": /^Ana/ },
            { "cpf": "222333494-55" }
        ]
    },
    {
        nome: 1,
        cpf: 1
    }
);


// 10 -> PROJECT - AVG
db.alunos.aggregate([{
  $project: {
    _id:0,
    nome: 1,
    cpf:  1,
    mediaProgresso: {
      $avg: "$cursos.progresso"
      },
    }
  }
]);

// 11 -> PROJECT - SIZE
db.alunos.aggregate([
    {
        $project: {
            _id: '$cpf',
            nome: 1,
            idiomasEmProgresso: { $size: '$cursos' }
       }
    }
 ]);

// 12 - MAPREDUCE: apresenta a sequencia média de alunos de acordo com seu ano de nascimento
db.alunos.mapReduce(
    function() { emit(this.aniversario.getFullYear(), this.acesso.sequencia); },
    function(anoAluno, sequenciaAluno) { return Array.avg(sequenciaAluno) },
    {
        out: "alunos_idade_seq",
        query: {"acesso.sequencia" : {"$gt" : 0}}
    }
);

// 13 - RENAMECOLLECTION: renomeia a coleção feita pelo mapreduce
db.alunos_idade_seq.renameCollection( "idade_seq" );

// 14 - UPDATEMANY: mudar o nome do idioma de "chines" para "chinês"
db.alunos.updateMany(
    {
        "cursos.idioma": "chines"
    }, 
    {
        $set: {
            "cursos.$.idioma": "chinês"
        }
    }
);

// 15 -> GTE, AGGREGATE, GROUP, AVG e SORT: agregar os idiomas e apresentar, ordenadamente,  a média de progresso de seus alunos nascidos a partir de 1995
db.alunos.aggregate( [
    // Stage 1: filtra para contar apenas os usuários nascidos a partir de 1995 
    {$match:{"aniversario": {$gte: new ISODate( "1995-01-01" )}}},

    {$unwind: "$cursos"},
    // Stage 2: agrupa e calcula a média
    {
       $group:
       {
          _id: "$cursos.idioma",
          avgProgress: { $avg: "$cursos.progresso" }
       }
    },
    // Stage 3: ordena de maior para menor
    {
       $sort: { avgProgress: -1 }
    }
  ] 
);

// 16 - CONSULTA USUARIOS QUE ACESSARAM NOS ULTIMOS TRES DIAS
db.alunos.find({
    $where: function() {
        const diasAtras = 3;
        var _data = new Date();
        _data.setDate(_data.getDate() - diasAtras);
        return this.acesso.ultimo.getTime() >= _data.getTime();
    }
}, {
    nome: 1,
    _id: "$cpf",
    "acesso.sequencia": 1,
    "acesso.ultimo": 1,
}).sort({ "acesso.sequencia": -1 });


// 17 - CONSULTA OS USUARIOS QUE NÃO CURSAM NADA
db.alunos.find({
    $or: [
        { cursos: { $exists: false } },
        { cursos: { $size: 0 } }
    ]
})


// 18 - CONSULTA ESTUDANTES E QNTD DE ATIVIDADES
db.idiomas.aggregate([
    {
        $lookup: {
            from: "alunos",
            localField: "lingua",
            foreignField: "cursos.idioma",
            as: "alunos_info"
        }
    },
    {
        $unwind: "$alunos_info"
    },
    {
        $group: {
            _id: "$lingua",
            alunos_count: { $sum: 1 },
            atividades_count: { $first: { $size: "$atividades" } }
        }
    }
]).pretty();



// 19 - CONSULTA PROGRESSO TOTAL DO ALUNO
db.alunos.aggregate([ {
        $match: {
            "cursos.progresso": { $exists: true, $ne: null }
        }
    },{
        $unwind: "$cursos"
    },{
    $group: {
        _id: "$cpf",
        nome: { $first: "$nome" },
        progressoTotal: { $sum: "$cursos.progresso" }
    }
}]);

// 20 - Remoção de dados: Removendo usuários que não usam a conta desde 1996 e que possuem pelo menos dois cursos atribuídos a si
db.alunos.deleteMany({$and: [{"acesso.ultimo": {$lt: new ISODate( "1997-01-01" )}}, {$nor: [{"cursos": {$size: 0}}, {"cursos": {$size: 1}}]}] });

// 21 - Procura todos os alunos que estudam, obrigatoriamente, japonês e coreano, e que tenham uma sequência de pelo menos 7 dias
db.alunos.find({$and: [{"cursos.idioma": {$all: ["japonês", "coreano"]}}, {"acesso.sequencia": {$gte: 7}}]}).pretty();